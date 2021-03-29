//
//  SetGameViewModel.swift
//  Play Set!
//
//  Created by Xiao Quan on 3/26/21.
//

import Foundation

class SetGameViewModel: ObservableObject {
    
    // MARK: - Game Initialization
    @Published private var game: SetGame = createSetGame()
    
    private static func createSetGame() -> SetGame {
        return SetGame()
    }
    
    // MARK: - Access to Model
    var deck: Array<SetGame.PlayCard> { game.deck }
    var onScreenCards: Array<SetGame.PlayCard> { game.onScreenCards }
    
    // MARK: - User Intents
    func choose(_ card: SetGame.PlayCard) {
        game.choose(card)
    }
    
}
