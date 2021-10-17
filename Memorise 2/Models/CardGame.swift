//
//  CardGame.swift
//  Memorise 2
//
//  Created by Peter Wright on 17/10/2021.
//

import Foundation
struct CardGame<T> {
    private(set) var deck: Array<Card<T>>
    
    mutating func choose( card: Card<T> ) {
        if let match = index( of: card ) {
            deck[match].choose()
        }
    }
    
    mutating func match( card: Card<T> ) {
        if let match = index( of: card ) {
            deck[match].match()
        }
    }
                                   
    private func index(of card: Card<T> ) -> Int? {
        deck.firstIndex(where: { $0.id == card.id } )
    }
                                        
}
