//
//  Set.swift
//  Set
//
//  Created by Abdalla Elsaman on 1/23/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

import Foundation

class Set {
    
    var deck = [Card]()
    var showingPlayingCards = [Card?](repeating: nil, count: 24)
    
    init() {
        for number in 1...3 {
            for color in 1...3 {
                for symbol in 1...3 {
                    for shading in 1...3 {
                        deck.append(
                            Card(
                                number: Card.varient(rawValue: number)!,
                                color: Card.varient(rawValue: color)!,
                                symbol: Card.varient(rawValue: symbol)!,
                                shading: Card.varient(rawValue: shading)!
                            )
                        )
                    }
                }
            }
        }
        deck.shuffle()
        for i in 0..<12 {
            showingPlayingCards[i] = deck.remove(at: 0)
        }
    }
    
    func dealMoreCards () {
        print(deck.count)
        var showingCounter = 0
        for card in showingPlayingCards {
            if card == nil && showingCounter < 3 && deck.count > 0 {
                let index = showingPlayingCards.index(of: card)!
                showingPlayingCards[index] = deck.remove(at: 0)
                showingCounter += 1
            }
        }
    }
    
    func isMatched (_ index1: Int, _ index2: Int, _ index3: Int) -> Bool {
        
        let sameColor = showingPlayingCards[index1]!.color == showingPlayingCards[index2]!.color &&
                        showingPlayingCards[index2]!.color == showingPlayingCards[index3]!.color
        let sameNumber = showingPlayingCards[index1]!.number == showingPlayingCards[index2]!.number &&
                         showingPlayingCards[index2]!.number == showingPlayingCards[index3]!.number
        let sameSymbol = showingPlayingCards[index1]!.symbol == showingPlayingCards[index2]!.symbol &&
                         showingPlayingCards[index2]!.symbol == showingPlayingCards[index3]!.symbol
        let sameShading = showingPlayingCards[index1]!.shading == showingPlayingCards[index2]!.shading &&
                          showingPlayingCards[index2]!.shading == showingPlayingCards[index3]!.shading
        
        let differentColor = showingPlayingCards[index1]!.color != showingPlayingCards[index2]!.color &&
                             showingPlayingCards[index1]!.color != showingPlayingCards[index3]!.color &&
                             showingPlayingCards[index2]!.color != showingPlayingCards[index3]!.color
        let differentNumber = showingPlayingCards[index1]!.number != showingPlayingCards[index2]!.number &&
                              showingPlayingCards[index1]!.number != showingPlayingCards[index3]!.number &&
                              showingPlayingCards[index2]!.number != showingPlayingCards[index3]!.number
        let differentSymbol = showingPlayingCards[index1]!.symbol != showingPlayingCards[index2]!.symbol &&
                              showingPlayingCards[index1]!.symbol != showingPlayingCards[index3]!.symbol &&
                              showingPlayingCards[index2]!.symbol != showingPlayingCards[index3]!.symbol
        let differentShading = showingPlayingCards[index1]!.shading != showingPlayingCards[index2]!.shading &&
                               showingPlayingCards[index1]!.shading != showingPlayingCards[index3]!.shading &&
                               showingPlayingCards[index2]!.shading != showingPlayingCards[index3]!.shading
        
        if (sameColor || differentColor) && (sameNumber || differentNumber) && (sameSymbol || differentSymbol) && (sameShading || differentShading){
            showingPlayingCards[index1] = nil
            showingPlayingCards[index2] = nil
            showingPlayingCards[index3] = nil
            return true
        }
        return false
    }
    
}
