//
//  Card.swift
//  Memorise 2
//
//  Created by Peter Wright on 17/10/2021.
//

import Foundation
struct Card<T> {
    var id: Int
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var content: T
    
    mutating func choose() {
        self.isFaceUp.toggle()
    }
    
    mutating func match() {
        self.isMatched.toggle()
    }
}
