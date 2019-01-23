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
    
    var selectedCards = [Card]()
    
    init() {
        for number in 1...3 {
            for color in 1...3 {
                for symbol in 1...3 {
                    for shading in 1...3 {
                        deck.append(Card(
                            number: Card.varient(rawValue: number)!,
                            color: Card.varient(rawValue: color)!,
                            symbol: Card.varient(rawValue: symbol)!,
                            shading: Card.varient(rawValue: shading)!)
                        )
                    }
                }
            }
        }
    }
    
    func chooseCard(at index: Int) {
        selectedCards.append(deck.remove(at: index))
    }
    
    private func isMatched (_ card1: Card, _ card2: Card, _ card3: Card) -> Bool {
        
        // checking matching regardling to game rules
        
        if ((card1.color == card1.color && card2.color == card2.color && card3.color == card3.color) ||
            (card1.color != card1.color && card2.color != card2.color && card3.color != card3.color)) &&
            ((card1.symbol == card1.symbol && card2.symbol == card2.symbol && card3.symbol == card3.symbol) ||
            (card1.symbol != card1.symbol && card2.symbol != card2.symbol && card3.symbol != card3.symbol)) &&
            ((card1.shading == card1.shading && card2.shading == card2.shading && card3.shading == card3.shading) ||
            (card1.shading != card1.shading && card2.shading != card2.shading && card3.shading != card3.shading)) &&
            ((card1.number == card1.number && card2.number == card2.number && card3.number == card3.number) ||
            (card1.number != card1.number && card2.number != card2.number && card3.number != card3.number))
        {
            return true
        }
        return false
    }
    
}
