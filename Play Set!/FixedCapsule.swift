//
//  DisplacedCapsule.swift
//  Play Set!
//
//  Created by Xiao Quan on 3/28/21.
//

import SwiftUI

struct FixedCapsule: Shape {
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let diameter = min(rect.width, rect.height) * 0.8
        
        let leftCenter = CGPoint(x: center.x - diameter / 4, y: center.y)
        let rightCenter = CGPoint(x: center.x + diameter / 4, y: center.y)
        let topLeft = CGPoint(x: leftCenter.x, y: leftCenter.y - diameter/3)
//        let topRight = CGPoint(x: rightCenter.x, y: rightCenter.y - diameter/4)
//        let bottomLeft = CGPoint(x: leftCenter.x, y: leftCenter.y + diameter/4)
        let bottomRight = CGPoint(x: rightCenter.x, y: rightCenter.y + diameter/3)
        
        var p = Path()
        p.addArc(center: leftCenter, radius: diameter / 3, startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 180-90), clockwise: true)
        p.addLine(to: bottomRight)
        p.addArc(center: rightCenter, radius: diameter / 3, startAngle: Angle(degrees: 180-90), endAngle: Angle(degrees: 0-90), clockwise: true)
        p.addLine(to: topLeft)
        
        return p
    }
}
