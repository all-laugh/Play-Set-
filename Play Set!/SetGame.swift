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
    var selectedCards = Array<PlayCard>()
    var matchedCards = Array<PlayCard>()
    
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
        print("-----------------------------")
        let chosenIndex = onScreenCards.firstIndex(matching: card)!
        
        print(card.isSelected)
        onScreenCards[chosenIndex].isSelected = !onScreenCards[chosenIndex].isSelected
        
        if onScreenCards[chosenIndex].isSelected {
            selectedCards.append(onScreenCards[chosenIndex])
        } else {
            selectedCards.remove(at: selectedCards.firstIndex(matching: card)!)
        }
        
        print(selectedCards.count)
        
        if selectedCards.count == 3 {
            let isMatched = checkIfMatched()
            print("Checking if there's a match!")
            if isMatched {
                print("Matched!")
                for index in selectedCards.indices {
                    let selectedCard = selectedCards[index]
//                    selectedCards[index].isMatched = true
                    if let onScreenCardIndex = onScreenCards.firstIndex(matching: selectedCard) {
                        onScreenCards[onScreenCardIndex].isMatched = true
                    }
                }
            }
        }
        
    }
    
    private func checkIfMatched() -> Bool {
        let firstCard = selectedCards[0]
        let secondCard = selectedCards[1]
        let thirdCard = selectedCards[2]
        
        let colorMatch = isSet(firstCard.color, secondCard.color, thirdCard.color)
        let numberMatch = isSet(firstCard.number, secondCard.number, thirdCard.number)
        let shapeMatch = isSet(firstCard.shape, secondCard.shape, thirdCard.shape)
        let shadingMatch = isSet(firstCard.shading, secondCard.shading, thirdCard.shading)

        return colorMatch && numberMatch && shapeMatch && shadingMatch
    }
    
    private func isSet<CardAttribute: Comparable>(_ a: CardAttribute, _ b: CardAttribute, _ c: CardAttribute ) -> Bool {
        return ( a == b && b == c ) || ( a != b && b != c && a != c )
    }
    
    
    // MARK: - Card Attributes
    struct PlayCard: Identifiable {
        var id: Int
        var number: PatternAttributes.CardNumber
        var color: PatternAttributes.CardColor
        var shape: PatternAttributes.CardShape
        var shading: PatternAttributes.CardShading
        var isSelected = false
        var isMatched = false
//        var content: CardContent
        
    }
}

