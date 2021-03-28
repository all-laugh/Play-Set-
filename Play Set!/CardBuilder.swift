//
//  CardPattern.swift
//  Play Set!
//
//  Created by Xiao Quan on 3/27/21.
//

import SwiftUI

struct CardBuilder: View {

    var card: SetGame.PlayCard
    var color: Color {
        switch card.color {
        case .green:
            return .green
        case .purple:
            return .purple
        case .red:
            return .red
        }
    }
    
    var shading: Double {
        switch card.shading {
        case .opaque:
            return 1
        case .shaded:
            return 0.5
        case.transparent:
            return 1
        }
    }
    
    init(_ card: SetGame.PlayCard) {
        self.card = card
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ForEach (0..<card.number.rawValue) { _ in
                    if card.shading == .transparent {
                        ShapeBuilder(card.shape).stroke(lineWidth: CGFloat(3))
                    } else {
                        ShapeBuilder(card.shape)
                    }
                }
                .padding(2)
            }
            .cardify()
            .foregroundColor(color)
            .opacity(shading)
            
//            self.body(for: GridLayout(itemCount: items.count, in: geometry.size))
        }

    }
    
    
}

struct ShapeBuilder: Shape {
    var shape: PatternAttributes.CardShape
    
    init(_ shape: PatternAttributes.CardShape) {
        self.shape = shape
    }
    
    func path(in rect: CGRect) -> Path {
        switch self.shape {
        case .capsule:
            return FixedCapsule().path(in: rect)
        case .triangle:
            return Diamond().path(in: rect)
        case .displacedCircle:
            return DisplacedCircle()
                .path(in: rect)
        }
    }
}

