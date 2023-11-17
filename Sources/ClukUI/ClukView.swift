//
//  ClukView.swift
//
//
//  Created by Pierre Janineh on 15/11/2023.
//

import SwiftUI

public struct ClukView: View {
    
    @State private var date: Date
    
    /**
     Creates an analog clock view.
     - Parameter date: A Date instance, pass `nil` for default value = `Date()`.
     */
    public init(date: Date? = nil) {
        guard let date = date else {
            self._date = .init(initialValue: Date())
            return
        }
        self._date = .init(initialValue: date)
    }
    
    private let timer = Timer.publish(
        every: 1,
        on: .main,
        in: .common
    ).autoconnect()
    
    public var body: some View {
        VStack {
            if #available(iOS 14.0, tvOS 14.0, macOS 11.0, *) {
                Text(date, style: .time)
            } else {
                Text(date.description)
            }
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 2)
                
                // Hour hand
                ClukHand(rotationAngle: .degrees(calculateAngle(.hour)),
                         length: 50)
                .stroke(lineWidth: 4)
                
                // Minute hand
                ClukHand(rotationAngle: .degrees(calculateAngle(.minute)),
                         length: 70)
                .stroke(lineWidth: 3)
                
                // Second hand
                ClukHand(rotationAngle: .degrees(calculateAngle(.second)),
                         length: 90)
                .stroke(Color.red, lineWidth: 2)
            }
            .frame(width: 200, height: 200)
            .onReceive(timer) { input in
                date = input
            }
        }
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
}

#if DEBUG
#Preview {
    ClukView(date: Date())
}
#endif
