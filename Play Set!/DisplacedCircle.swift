//
//  DisplacedCapsule.swift
//  Play Set!
//
//  Created by Xiao Quan on 3/28/21.
//

import SwiftUI

struct DisplacedCircle: Shape {
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let diameter = min(rect.width, rect.height) * 0.6
        
        let rightPoint = CGPoint(x: center.x + diameter * 0.75, y: center.y - diameter/16)
        let midRightPoint = CGPoint(x: center.x + diameter / 4, y: center.y - diameter/16)
        let midLeftPoint = CGPoint(x: center.x - diameter / 4, y: center.y + diameter/16)
//        let leftPoint = CGPoint(x: center.x - diameter * 0.75, y: center.y)
        
        var p = Path()
//        p.move(to: rightPoint)
        p.addArc(center: midRightPoint, radius: diameter/2, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 180), clockwise: true)
        p.addLine(to: midLeftPoint)
        p.addArc(center: midLeftPoint, radius: diameter/2, startAngle: Angle(degrees: 0-180), endAngle: Angle(degrees: 0), clockwise: true)
        p.addLine(to: midRightPoint)
        p.addLine(to: rightPoint)
        return p
    }
}
