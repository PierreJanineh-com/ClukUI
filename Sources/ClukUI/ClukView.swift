//
//  ClukView.swift
//
//
//  Created by Pierre Janineh on 15/11/2023.
//

import SwiftUI

public struct ClukView: View {
    
    @Binding var now: Date
    
    private let timer = Timer.publish(
        every: 1,
        on: .main,
        in: .common
    ).autoconnect()
    
    public var body: some View {
        VStack {
            if #available(iOS 14.0, tvOS 14.0, macOS 11.0, *) {
                Text(now, style: .time)
            } else {
                Text(now.description)
            }
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 2)
                
                // Hour hand
                ClukHand(rotationAngle: .degrees(hourAngle),
                         length: 50)
                .stroke(lineWidth: 4)
                
                // Minute hand
                ClukHand(rotationAngle: .degrees(minuteAngle),
                         length: 70)
                .stroke(lineWidth: 3)
                
                // Second hand
                ClukHand(rotationAngle: .degrees(secondAngle),
                         length: 90)
                .stroke(Color.red, lineWidth: 2)
            }
            .frame(width: 200, height: 200)
            .onReceive(timer) { input in
                now = input
            }
        }
    }
    
    private var hourAngle: Double {
        let hour = Double(Calendar.current.component(.hour, from: now))
        return (hour / 12) * 360
    }
    
    private var minuteAngle: Double {
        let minutes = Double(Calendar.current.component(.minute, from: now))
        return (minutes / 60) * 360
    }
    
    private var secondAngle: Double {
        let seconds = Double(Calendar.current.component(.second, from: now))
        return (seconds / 60) * 360
    }
}

private struct ClukHand: Shape {
    var rotationAngle: Angle
    var length: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX + cos(rotationAngle.radians - .pi / 2) * length,
                                 y: rect.midY + sin(rotationAngle.radians - .pi / 2) * length))
        return path
    }
}

#Preview {
    ClukView(now: .constant(.init()))
}
