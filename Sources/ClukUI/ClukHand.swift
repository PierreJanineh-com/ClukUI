//
//  ClukHand.swift
//
//
//  Created by Pierre Janineh on 17/11/2023.
//

import SwiftUI

internal struct ClukHand: Shape {
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
