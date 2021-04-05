//
//  Cardify.swift
//  Memory
//
//  Created by Xiao Quan on 3/25/21.
//

import SwiftUI

struct Cardify: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius).fill(Color.clear)
//                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: borderWidth)
                content

        }
    }
    
    private let cornerRadius: CGFloat = 10.0
//    private let borderWidth: CGFloat = 2.0
}

extension View {
    func cardify() -> some View {
        self.modifier(Cardify())
    }
}
