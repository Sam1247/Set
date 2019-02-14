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
    var playingCards = [Card]()
    
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
        for _ in 0..<12 {
            playingCards.append(deck.remove(at: 0))
        }
    }
    
    func dealMoreCards () {
        assert(deck.count < 3, "the dick is Empty")
        for _ in 0..<3 {
            playingCards.append(deck.removeFirst())
        }
    }
    
    func isMatched (_ index1: Int, _ index2: Int, _ index3: Int) -> Bool {
        if ((playingCards[index1].color == playingCards[index1].color && playingCards[index2].color == playingCards[index2].color && playingCards[index3].color == playingCards[index3].color) ||
            (playingCards[index1].color != playingCards[index1].color && playingCards[index2].color != playingCards[index2].color && playingCards[index3].color != playingCards[index3].color)) &&
            ((playingCards[index1].symbol == playingCards[index1].symbol && playingCards[index2].symbol == playingCards[index2].symbol && playingCards[index3].symbol == playingCards[index3].symbol) ||
            (playingCards[index1].symbol != playingCards[index1].symbol && playingCards[index2].symbol != playingCards[index2].symbol && playingCards[index3].symbol != playingCards[index3].symbol)) &&
            ((playingCards[index1].shading == playingCards[index1].shading && playingCards[index2].shading == playingCards[index2].shading && playingCards[index3].shading == playingCards[index3].shading) ||
            (playingCards[index1].shading != playingCards[index1].shading && playingCards[index2].shading != playingCards[index2].shading && playingCards[index3].shading != playingCards[index3].shading)) &&
            ((playingCards[index1].number == playingCards[index1].number && playingCards[index2].number == playingCards[index2].number && playingCards[index3].number == playingCards[index3].number) ||
            (playingCards[index1].number != playingCards[index1].number && playingCards[index2].number != playingCards[index2].number && playingCards[index3].number != playingCards[index3].number))
        {
            playingCards.remove(at: index1)
            playingCards.remove(at: index2)
            playingCards.remove(at: index3)
            return true
        }
        return false
    }
    
}
