//
//  SetCard.swift
//  Set
//
//  Created by Abdalla Elsaman on 2/13/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

import UIKit

class SetCard: UIButton {
    
    enum SelectionState {
        case deselected, selected, matched, deleted, misMatched
    }
    
    private(set) var selectionState: SelectionState = .deleted
    
    
    func setState(state: SelectionState) {
        switch state {
        case .selected:
            isEnabled = true
            selectionState = .selected
            self.layer.borderWidth = 3.0
            self.layer.borderColor = UIColor.blue.cgColor
        case .matched:
            isEnabled = false
            selectionState = .matched
            self.layer.borderWidth = 3.0
            self.layer.borderColor = UIColor.cyan.cgColor
        case .misMatched:
            isEnabled = false
            selectionState = .matched
            self.layer.borderWidth = 3.0
            self.layer.borderColor = UIColor.red.cgColor
        case .deleted:
            isEnabled = false
            selectionState = .deleted
            self.setAttributedTitle(nil, for: .normal)
            self.setTitle("", for: UIControl.State.normal)
            self.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0)
            self.layer.borderWidth = 0
        case .deselected:
            isEnabled = true
            selectionState = .deselected
            self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.layer.borderWidth = 0
        }
    }
    
}
