//
//  EmojiGame.swift
//  Memorise 2
//
//  Created by Peter Wright on 17/10/2021.
//

import Foundation

let themes = [
    Theme(name: "Travel", emojis: ["✈️", "🚀", "🚘", "🚎", "🚛", "🚐", "⛴", "🏍", "🚁", "🚂"], pairs: 6),
    Theme(name: "Ballgames", emojis: ["⚽️", "🏉", "🎱", "🏐", "🏀", "⚾️", "🏈", "🎾"], pairs: 7),
    Theme(name: "Technology", emojis: ["💻", "💿", "🖥", "🖱", "⌨️", "💾", "🎮"], pairs: 5),
    Theme(name: "Music", emojis: ["🎻", "🎺", "🎷", "🎹", "🎸", "🥁", "🎧"], pairs: 4),
    Theme(name: "Food", emojis: ["🍔", "🌭", "🌮", "🍟", "🍗", "🍪", "🧁", "🍨", "🍰"], pairs: 7),
    Theme(name: "Animals", emojis: ["🐱", "🐰", "🦊", "😹", "🐻", "🐻‍❄️", "🐹", "🐭", "🐶","🐷"], pairs: 8)
]

class EmojiGame : ObservableObject {
    @Published var cardGame: CardGame<String>
    @Published var selectedTheme: String = ""
        
    init(theme: Theme) {
        cardGame = CardGame<String>(values: theme.emojis, pairs: theme.pairs)
        selectedTheme = theme.name
    }
    
    func choose( card: Card<String> ) {
        cardGame.choose(card: card)
    }
    
    func resetGame() {
        let themeNumber: Int = Int.random(in: 0...5)
        
        let theme = themes[themeNumber]
        selectedTheme = theme.name
        
        cardGame = CardGame<String>( values: theme.emojis, pairs: theme.pairs)
    }
}
