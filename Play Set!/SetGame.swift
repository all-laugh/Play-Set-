//
//  SetGame.swift
//  Play Set!
//
//  Created by Xiao Quan on 3/26/21.
//

import Foundation

struct SetGame {
    var deck: Array<PlayCard>
    var onScreenCards = Array<PlayCard>()
    
    init() {
        deck = Array<PlayCard>()
        var id = 0
        for number in PatternAttributes.CardNumber.allCases {
            for color in PatternAttributes.CardColor.allCases {
                for shape in PatternAttributes.CardShape.allCases {
                    for shading in PatternAttributes.CardShading.allCases {
                        deck.append(
                            PlayCard(
                                id: id,
                                number: number,
                                color: color,
                                shape: shape,
                                shading: shading
                                )
                        )
                        id += 1
                    }
                }
            }
        }
        deck.shuffle()
        self.startGame()
    }
    
    // MARK: - Gameplay
    mutating func startGame() {
        for index in 0..<12 {
            onScreenCards.append(deck.remove(at: index))
        }
    }
    
    mutating func choose(_ card: PlayCard) {
        
    }
    
    
    // MARK: - Card Attributes
    struct PlayCard: Identifiable {
        var id: Int
        var number: PatternAttributes.CardNumber
        var color: PatternAttributes.CardColor
        var shape: PatternAttributes.CardShape
        var shading: PatternAttributes.CardShading
        var isSelected: Bool = false
//        var content: CardContent
    }
}

