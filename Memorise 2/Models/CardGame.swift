//
//  CardGame.swift
//  Memorise 2
//
//  Created by Peter Wright on 17/10/2021.
//

import Foundation
struct CardGame<T> {
    private(set) var deck: [Card<T>]

    init( values: Array<T>, pairs: Int) {
        let tempArray = values.shuffled()
        
        var cardPairs: Array<Card<T>> = []
        for i in 0..<pairs {
            cardPairs.append(Card(id: i*2, content: tempArray[i]))
            cardPairs.append(Card(id: i*2+1, content: tempArray[i]))
        }
        
        self.deck = cardPairs.shuffled()
    }
    
    
    var firstCardIndex: Int? = nil
    
    // MARK: State Mutators
    mutating func choose( card: Card<T> ) {
        
        if !card.isFlippable { return }
        
        resetDeck()
        
        if let cardIndex = index(of: card) {
            deck[cardIndex].isFaceUp = true
            checkIfDeckHasAMatchFor(cardIndex)
        }
        
    }
    
    // MARK: Private helper methods
    private func index(of card: Card<T> ) -> Int? {
        deck.firstIndex(where: { $0.id == card.id } )
    }
    
    mutating private func resetDeck() {
        if deck.compactMap({$0.isFaceUp ? $0 : nil}).count < 2 { return }
        firstCardIndex = nil
        for i in deck.indices { deck[i].isFaceUp = false }
    }
    
    mutating private func checkIfDeckHasAMatchFor(_ cardIndex: Int) {
        if let firstCard = firstCardIndex  {
            if deck[cardIndex].containsTheSame(deck[firstCard].content) {
                deck[cardIndex].isMatched = true
                deck[firstCard].isMatched = true
            }
        } else {
            firstCardIndex = cardIndex
        }
    }
    
}
