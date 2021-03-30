//
//  Triangle.swift
//  Play Set!
//
//  Created by Xiao Quan on 3/28/21.
//

import SwiftUI

struct Diamond: Shape {
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let diameter = min(rect.width, rect.height)
        let thirtyDegrees = Angle(degrees: 30)
        let top = CGPoint(
            x: center.x,
            y: center.y - CGFloat(diameter / 4)
        )
        
        let midLeft = CGPoint (
            x: center.x - diameter/2 * cos(CGFloat(thirtyDegrees.radians)),
            y: center.y
        )
        
        let midRight = CGPoint(
            x: center.x + diameter/2 * cos(CGFloat(thirtyDegrees.radians)),
            y: center.y
        )
        
        let bottom = CGPoint(
            x: center.x,
            y: center.y + CGFloat(diameter / 4)
        )
        
        
        var p = Path()
        p.addLines([top, midLeft, bottom, midRight, top])
        p.move(to: top)
        
        return p
    }
}
