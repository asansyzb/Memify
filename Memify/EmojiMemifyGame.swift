//
//  EmojiMemifyGame.swift
//  Memify
//
//  Created by Alibek Sansyzbayev on 5/28/20.
//  Copyright © 2020 Alibek Sansyzbayev. All rights reserved.
//

import Foundation

class EmojiMemifyGame: ObservableObject {
    @Published private var game: MemifyGame<String> = EmojiMemifyGame.createMemifyGame()
    
    static func createMemifyGame() -> MemifyGame<String> {
        let emojis = ["🧛🏻‍♂️", "🧛🏻‍♀️", "👻", "💀", "⚰️"]
        return MemifyGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    var cards: Array<MemifyGame<String>.Card> {
        game.cards
    }
    
    func choose(card: MemifyGame<String>.Card) {
        game.choose(card: card)
    }
}
