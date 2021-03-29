//
//  ContentView.swift
//  Play Set!
//
//  Created by Xiao Quan on 3/26/21.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var setGameViewModel: SetGameViewModel
    var body: some View {
        VStack {
            Grid(setGameViewModel.onScreenCards) { card in
                CardBuilder(card).onTapGesture {
                    setGameViewModel.choose(card)
                }
                .padding(5)
            }
        }
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let setGameViewModel = SetGameViewModel()
        SetGameView(setGameViewModel: setGameViewModel)
    }
}
