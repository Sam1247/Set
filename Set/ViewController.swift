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
    
    
}

