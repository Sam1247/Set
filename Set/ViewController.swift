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
    @IBOutlet weak var DealButton: SetCard!
    @IBOutlet weak var newGameButton: UIButton!
    
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
        DealButton.layer.cornerRadius = 5
        newGameButton.layer.cornerRadius = 5
        drawAllCards()
    }
    
    @IBAction func touchCard(_ sender: SetCard) {
        sender.setState(state: SetCard.SelectionState.selected)
        selectedCards.append(sender)
    }
    
    @IBAction func deal(_ sender: SetCard) {
        game.dealMoreCards()
        drawAllCards()
    }
    
    @IBAction func newGame(_ sender: SetCard) {
    }
    
    
    func updateViewFromModel () {
        
    }
    
    func drawAllCards () {
        for index in playingCards.indices {
            if game.showingPlayingCards[index] == nil {
                playingCards[index].setState(state: .deleted)
            } else {
                playingCards[index].setState(state: .deselected)
                let text: String
                let font = UIFont.systemFont(ofSize: 30)
                var attributes : [NSAttributedString.Key : Any] = [
                    .font: font
                ]
                
                switch  game.showingPlayingCards[index]!.symbol {
                case .one:
                    switch  game.showingPlayingCards[index]!.number {
                    case .one:
                        text = "▲"
                    case .two:
                        text = "▲▲"
                    case .three:
                        text = "▲▲▲"
                    }
                case .two:
                    switch  game.showingPlayingCards[index]!.number {
                    case .one:
                        text = "■"
                    case .two:
                        text = "■■"
                    case .three:
                        text = "■■■"
                    }
                case .three:
                    switch  game.showingPlayingCards[index]!.number {
                    case .one:
                        text = "●"
                    case .two:
                        text = "●●"
                    case .three:
                        text = "●●●"
                    }
                }
                
                switch  game.showingPlayingCards[index]!.color {
                case .one:
                    switch  game.showingPlayingCards[index]!.shading {
                    case .one:
                        attributes[.foregroundColor] = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).withAlphaComponent(0.25)
                    case .two:
                        attributes[.foregroundColor] = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).withAlphaComponent(0.65)
                    case .three:
                        attributes[.foregroundColor] = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).withAlphaComponent(1.0)
                    }
                case .two:
                    switch  game.showingPlayingCards[index]!.shading {
                    case .one:
                        attributes[.foregroundColor] = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.25)
                    case .two:
                        attributes[.foregroundColor] = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.65)
                    case .three:
                        attributes[.foregroundColor] = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1).withAlphaComponent(1.0)
                    }
                case .three:
                    switch  game.showingPlayingCards[index]!.shading {
                    case .one:
                        attributes[.foregroundColor] = #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1).withAlphaComponent(0.25)
                    case .two:
                        attributes[.foregroundColor] = #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1).withAlphaComponent(0.65)
                    case .three:
                        attributes[.foregroundColor] = #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1).withAlphaComponent(1.0)
                    }
                }
                
                let attributedString = NSAttributedString(string: text, attributes: attributes)
                playingCards[index ].setAttributedTitle(attributedString, for: .normal)
            }
            }
        }
        
    
}

