//
//  ContentView.swift
//  Play Set!
//
//  Created by Xiao Quan on 3/26/21.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var setGameViewModel: SetGameViewModel
    
    var noCardsLeft: Bool { setGameViewModel.noCardsLeft }
    
    var body: some View {
        VStack {
            Grid(setGameViewModel.onScreenCards) { card in
                CardBuilder(card).onTapGesture {
                    setGameViewModel.choose(card)
                    withAnimation(Animation.easeInOut(duration: 0.6)) {
                        setGameViewModel.checkSetMatch(card)
                    }
                }
                .padding(5)
            }
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 1.5).delay(0.1)) {
                    self.setGameViewModel.startGame()
                }
            }

            HStack {
                if !noCardsLeft {
                    Button("Three More!") {
                        withAnimation(.easeInOut) {
                            setGameViewModel.addThreeCards()
                        }
                    }
                    .foregroundColor(.red)
                    
                }
                Spacer(minLength:5)
                
                Button("New Game") {
                    withAnimation(Animation.easeInOut(duration: 1)) {
                        setGameViewModel.restartGame()
                    }
                }
                .foregroundColor(.green)
            }
            .font(Font.title.bold())
            .padding(.horizontal, 20)
            
        }

    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let setGameViewModel = SetGameViewModel()
        SetGameView(setGameViewModel: setGameViewModel)
    }
}
