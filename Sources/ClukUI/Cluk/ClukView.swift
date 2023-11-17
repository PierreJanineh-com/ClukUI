//
//  ClukView.swift
//
//
//  Created by Pierre Janineh on 15/11/2023.
//

import SwiftUI

public struct ClukView: View {
    
    @State private var date: Date
    
    private var config: ClukConfigurations?
    
    /**
     Creates an analog clock view.
     - Parameters
        - date: A Date instance, pass `nil` for default value = `Date()`.
        - config: The ClukConfiguration instance to customize the `Cluk`
     */
    public init(date: Date? = nil, 
                config: ClukConfigurations? = nil) {
        guard let date = date else {
            self._date = .init(initialValue: Date())
            return
        }
        self._date = .init(initialValue: date)
        self.config = config
    }
    
    private let timer = Timer.publish(
        every: 1,
        on: .main,
        in: .common
    ).autoconnect()
    
    public var body: some View {
        VStack {
            if let config,
               !config.builder.timeTextIsHidden {
                if #available(iOS 14.0, tvOS 14.0, macOS 11.0, *) {
                    Text(date, style: .time)
                } else {
                    Text(date.description)
                }
            }
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 2)
                
                // Hour hand
                ClukHand(rotationAngle: .degrees(calculateAngle(.hour)),
                         length: length(.hour))
                .stroke(lineWidth: 4)
                
                // Minute hand
                ClukHand(rotationAngle: .degrees(calculateAngle(.minute)),
                         length: length(.minute))
                .stroke(lineWidth: 3)
                
                // Second hand
                ClukHand(rotationAngle: .degrees(calculateAngle(.second)),
                         length: length(.second))
                .stroke(Color.red, lineWidth: 2)
            }
            .padding()
            .onReceive(timer) { input in
                date = input
            }
        }
        .padding()
    }
    
    /**
     Calculates clock hands angles in ticking style.
     - Parameter component: the Calendar.Component (.hour, .minute, .second) for the clock hand.
     */
    private func calculateAngle(_ component: Calendar.Component) -> Double {
        let componentValue = Double(Calendar.current.component(component, from: date))
        let division: Double = component == .hour ? 12 : 60
        return (componentValue / division) * 360
    }
    
    /**
     Returns clock hands length by component.
     - Parameter component: the Calendar.Component (.hour, .minute, .second) for the clock hand.
     */
    private func length(_ component: Calendar.Component) -> CGFloat {
#if os(iOS)
        switch component {
        case .hour:
            50
        case .minute:
            70
        case .second:
            90
        default:
            90
        }
#else
        switch component {
        case .hour:
            100
        case .minute:
            120
        case .second:
            130
        default:
            130
        }
#endif
    }
}

#if DEBUG
#Preview {
    ClukView(date: Date())
}
#endif
