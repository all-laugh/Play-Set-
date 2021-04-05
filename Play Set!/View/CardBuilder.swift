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
        case .pink:
            return .pink
        case .purple:
            return .purple
        case .green:
            return .green
        }
    }
    
    var shading: Double {
        switch card.shading {
        case .opaque:
            return 1
        case .shaded:
            return 0.5
        default:
            return 1
        }
    }
    
    init(_ card: SetGame.PlayCard) {
        self.card = card
    }
    
    var body: some View {
            VStack {
                ForEach (0..<card.number.rawValue) { _ in
                    if card.shading == .transparent {
                        ShapeBuilder(card.shape).stroke(lineWidth: 3)
                    }
                    else {
                        ShapeBuilder(card.shape)
                    }
                }
                .padding(.horizontal, 2)
                .opacity(shading)
            }
            .cardify()
            .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: card.isSelected ? 8 : 2)
            )
            .foregroundColor(matchColor(card))
            .transition(AnyTransition.offset(randomOffScreenPosition()))
    }
    
    private func matchColor(_ card: SetGame.PlayCard) -> Color {
        if let matched = card.isMatched {
            if matched {
                return .green
            } else { return .red }
        } else { return self.color }
    }
    
    private func randomOffScreenPosition() -> CGSize {
        let screen = UIScreen.main.bounds
        let width = Int(screen.width)
        let height = Int(screen.height)
        
        let randomOffscreenWidthRange = [-width-150 ... -width, width...width+150]
        let randomOffscreenHeightRange = [-height-150 ... -height, height...height+150]

        let randomWidthOffscreen = Int.random(in: randomOffscreenWidthRange.randomElement()!)
        let randomHeightOffscreen = Int.random(in: randomOffscreenHeightRange.randomElement()!)
        
        return CGSize(width: randomWidthOffscreen, height: randomHeightOffscreen)
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

