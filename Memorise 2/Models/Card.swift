//
//  Card.swift
//  Memorise 2
//
//  Created by Peter Wright on 17/10/2021.
//

import Foundation
struct Card<T> : Identifiable{    
    var id: Int
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var content: T
    
    var isFlippable:Bool {
        return !(isMatched || isFaceUp)
    }
    
    func containsTheSame(_ otherContent: T ) -> Bool {
        if let thisContent = content as? String {
            if let thatContent = otherContent as? String {
                return thatContent == thisContent
            }
        }
        return false
    }
}
