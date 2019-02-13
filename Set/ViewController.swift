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
    
    var selectedCards = [Card]()
    
    var game = Set()
    
    var setCards = [Int:Card]()
    
    // TODO:
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchCard(_ sender: SetCard) {
        sender.setState(state: SetCard.SelectionState.selected)
    }
    
    @IBAction func deal(_ sender: SetCard) {
        
    }
    
    @IBAction func newGame(_ sender: SetCard) {
    }
    
    
    func updateViewFromModel () {
        
        
        
    }
    
    
}

