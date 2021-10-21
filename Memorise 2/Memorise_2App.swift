//
//  Memorise_2App.swift
//  Memorise 2
//
//  Created by Peter Wright on 17/10/2021.
//

import SwiftUI

@main
struct Memorise_2App: App {
    var game: EmojiGame = EmojiGame("Technology")
    var body: some Scene {
        WindowGroup {
            ContentView(store: game)
        }
    } 
}
