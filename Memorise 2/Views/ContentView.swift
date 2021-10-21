//
//  ContentView.swift
//  Memorise 2
//
//  Created by Peter Wright on 17/10/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: EmojiGame
    
    let cell = GridItem(.adaptive(minimum: 80))
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [cell]) {
                ForEach(store.cardGame.deck) { card in
                    CardView(card: card )
                        .onTapGesture {
                            store.choose( card: card)
                        }
                }
            }.padding()
        }
    }
}

struct CardView: View {
    let card: Card<String>
    
    let cardRectangle = RoundedRectangle(cornerRadius: 20)
    
    var body: some View {
        ZStack {
            if (card.isMatched && !card.isFaceUp) {
                cardRectangle.opacity(0.2)
            } else if (!card.isFaceUp) {
                cardRectangle
                    .shadow(color: .gray, radius: 5, x:0, y:5)
            } else {
                cardRectangle
                    .strokeBorder(lineWidth: 3)
                Text(card.content)
            }
        }
        .aspectRatio(2/3, contentMode: .fill)
        .foregroundColor(.red)
        .font(.largeTitle)
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static let game = EmojiGame("Technology")
    static var previews: some View {
        ContentView(store: game)
    }
}
