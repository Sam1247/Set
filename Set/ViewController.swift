//
//  ViewController.swift
//  Set
//
//  Created by Abdalla Elsaman on 1/22/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var playingCards: [SetCard]!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var selectedCards = [SetCard]() {
        didSet {
            if selectedCards.count == 3 {
                for card in playingCards {
                    if card.selectionState == .selected {
                        card.setState(state: .deleted)
                    }
                }
                selectedCards.removeAll()
            }
        }
    }
    
    var game = Set()
    
    var setCards = [Int:Card]()
    
    // TODO:
    override func viewDidLoad() {
        super.viewDidLoad()
        for index in 0..<playingCards.count {
            playingCards[index].layer.cornerRadius = 5
        }
        draw()
    }
    
    @IBAction func touchCard(_ sender: SetCard) {
        sender.setState(state: SetCard.SelectionState.selected)
        selectedCards.append(sender)
    }
    
    @IBAction func deal(_ sender: SetCard) {
        
    }
    
    @IBAction func newGame(_ sender: SetCard) {
    }
    
    
    func updateViewFromModel () {
        
    }
    
    func draw () {
        let text: String
        let font = UIFont.systemFont(ofSize: 30)
        var attributes : [NSAttributedString.Key : Any] = [
           .font: font
        ]
        
        let card = Card(
            number: Card.varient(rawValue: 2)!,
            color: Card.varient(rawValue: 2)!,
            symbol: Card.varient(rawValue: 3)!,
            shading: Card.varient(rawValue: 3)!
        )
        
        switch  card.symbol {
        case .one:
            switch  card.number {
            case .one:
                text = "▲"
            case .two:
                text = "▲▲"
            case .three:
                text = "▲▲▲"
            }
        case .two:
            switch  card.number {
            case .one:
                text = "■"
            case .two:
                text = "■■"
            case .three:
                text = "■■■"
            }
        case .three:
            switch  card.number {
            case .one:
                text = "●"
            case .two:
                text = "●●"
            case .three:
                text = "●●●"
            }
        }
        
        switch  card.color {
        case .one:
            switch  card.shading {
            case .one:
                attributes[.foregroundColor] = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).withAlphaComponent(0.25)
            case .two:
                attributes[.foregroundColor] = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).withAlphaComponent(0.65)
            case .three:
                attributes[.foregroundColor] = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).withAlphaComponent(1.0)
            }
        case .two:
            switch  card.shading {
            case .one:
                attributes[.foregroundColor] = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.25)
            case .two:
                attributes[.foregroundColor] = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.65)
            case .three:
                attributes[.foregroundColor] = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1).withAlphaComponent(1.0)
            }
        case .three:
            switch  card.shading {
            case .one:
                attributes[.foregroundColor] = #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1).withAlphaComponent(0.25)
            case .two:
                attributes[.foregroundColor] = #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1).withAlphaComponent(0.65)
            case .three:
                attributes[.foregroundColor] = #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1).withAlphaComponent(1.0)
            }
        }
        
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        playingCards[0].setAttributedTitle(attributedString, for: .normal)
    }
    
}

