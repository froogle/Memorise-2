//
//  EmojiGame.swift
//  Memorise 2
//
//  Created by Peter Wright on 17/10/2021.
//

import Foundation

class EmojiGame : ObservableObject {
    @Published var cardGame: CardGame<String>
    @Published var selectedTheme: String
        
    init(_ themeName: String) {
        
        selectedTheme = themeName
        
        let themes = [
            Theme(name: "Travel", emojis: ["✈️", "🚀", "🚘", "🚎", "🚛", "🚐", "⛴", "🏍", "🚁", "🚂"], pairs: 6),
            Theme(name: "Ballgames", emojis: ["⚽️", "🏉", "🎱", "🏐", "🏀", "⚾️", "🏈", "🎾"], pairs: 7),
            Theme(name: "Technology", emojis: ["💻", "💿", "🖥", "🖱", "⌨️", "💾", "🎮"], pairs: 5),
            Theme(name: "Music", emojis: ["🎻", "🎺", "🎷", "🎹", "🎸", "🥁", "🎧"], pairs: 4),
            Theme(name: "Food", emojis: ["🍔", "🌭", "🌮", "🍟", "🍗", "🍪", "🧁", "🍨", "🍰"], pairs: 7),
            Theme(name: "Animals", emojis: ["🐱", "🐰", "🦊", "😹", "🐻", "🐻‍❄️", "🐹", "🐭", "🐶","🐷"], pairs: 8)
        ]
        let theme = themes.first(where: {$0.name == themeName})
        
        let emojis = theme?.emojis ?? themes[0].emojis
        let pairs = theme?.pairs ?? themes[0].pairs
        
        cardGame = CardGame<String>( values: emojis, pairs: pairs)
    }
    
    func choose( card: Card<String> ) {
        cardGame.choose(card: card)
    }
    
    private func buildCardGame(using: String) {

    }
    
}
