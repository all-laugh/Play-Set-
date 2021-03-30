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
    var setMatched: Bool?
    var matchedCards = Array<PlayCard>()
    var noCardsLeft: Bool = false
    
    // MARK: - Initialization
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
        }}}}
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
        selectCard(card)
        checkSetMatch(card)
        
    }
    
    private mutating func checkSetMatch (_ card: PlayCard) {
        if selectedCards.count == 3 {
            print("Checking if there's a match!")
            let isMatched = checkIfMatched()
            print( isMatched ? "There's a match!" : "No match" )
            updateCardMatch(isMatched)
            updateCards(cardChosen: card, isSelectionMatched: isMatched)
        }
    }
    
    private mutating func updateCards(cardChosen card: PlayCard, isSelectionMatched isMatched: Bool) {
        if let isSetMatched = setMatched {
            if isSetMatched {
                print("Removing on screen cards!")
                for selectedCard in selectedCards {
                    let onScreenCardIndex = onScreenCards.firstIndex(matching: selectedCard)!
                    matchedCards.append(onScreenCards.remove(at: onScreenCardIndex))
                }
                self.addThreeCards()
                selectedCards.removeAll()
                self.setMatched = nil
                return
            } else {
                print("Clear Selection")
                for selectedCard in selectedCards {
                    let onScreenCardIndex = onScreenCards.firstIndex(matching: selectedCard)!
                    onScreenCards[onScreenCardIndex].isSelected = false
                    onScreenCards[onScreenCardIndex].isMatched = nil
                }
                selectedCards.removeAll()
                self.setMatched = nil
                self.selectCard(card)
                return
            }
        } else {
            setMatched = isMatched
            
        }
    }
    
    private mutating func selectCard(_ card: PlayCard) {
        print("-----------------------------")
        let chosenIndex = onScreenCards.firstIndex(matching: card)!
        
        print(card.isSelected)
        
        if selectedCards.count < 3 {
            onScreenCards[chosenIndex].isSelected = !onScreenCards[chosenIndex].isSelected
            
            if onScreenCards[chosenIndex].isSelected {
                print("ADD CARD with ID \(card.id)")
                selectedCards.append(onScreenCards[chosenIndex])
            } else {
                print("REMOVE CARD with ID \(card.id)")
                selectedCards.remove(at: selectedCards.firstIndex(matching: card)!)
            }
            
        }
        print(selectedCards.map { $0.id })
    }
    
    private mutating func updateCardMatch(_ isMatch: Bool) {
        for selectedCard in selectedCards {
            if let onScreenCardIndex = onScreenCards.firstIndex(matching: selectedCard) {
                self.onScreenCards[onScreenCardIndex].isMatched = isMatch
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
    
    mutating func addThreeCards() {
        print("\(deck.count) cards left in deck")
        if deck.count >= 3 {
            for _ in 0..<3 {
                onScreenCards.append(deck.removeFirst())
            }
        } else if deck.count == 0 {
            noCardsLeft = true
        }
    }
    
    mutating func resetGame() {
        onScreenCards = Array<PlayCard>()
        selectedCards = Array<PlayCard>()
        setMatched = nil
        matchedCards = Array<PlayCard>()
        noCardsLeft = false
        self = .init()
    }
    
    
    // MARK: - Card Attributes
    struct PlayCard: Identifiable {
        var id: Int
        var number: PatternAttributes.CardNumber
        var color: PatternAttributes.CardColor
        var shape: PatternAttributes.CardShape
        var shading: PatternAttributes.CardShading
        var isSelected = false
        var isMatched: Bool?
//        var content: CardContent
        
    }
}

