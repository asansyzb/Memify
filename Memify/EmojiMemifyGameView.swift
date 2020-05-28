//
//  EmojiMemifyGameView.swift
//  Memify
//
//  Created by Alibek Sansyzbayev on 5/28/20.
//  Copyright © 2020 Alibek Sansyzbayev. All rights reserved.
//

import SwiftUI

struct EmojiMemifyGameView: View {
    @ObservedObject var viewModel: EmojiMemifyGame
    
    var body: some View {
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                self.viewModel.choose(card: card)
            }
                .aspectRatio(contentMode: .fit)
        }
            .padding()
            .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    var card: MemifyGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
        }
            .padding(5)
            .font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: - Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3.0
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}

struct EmojiMemifyGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemifyGame()
        return EmojiMemifyGameView(viewModel: game)
    }
}
