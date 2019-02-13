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
        case noChange, selected, matched, deleted
    }
    
    var selectionState: SelectionState = .noChange
    
    
    func setState(state: SelectionState) {
        switch state {
        case .selected:
            selectionState = .selected
            self.layer.borderWidth = 3.0
            self.layer.borderColor = UIColor.blue.cgColor
        case .matched:
            selectionState = .matched
            self.layer.borderWidth = 3.0
            self.layer.borderColor = UIColor.cyan.cgColor
        case .deleted:
            selectionState = .deleted
            self.setTitle("", for: UIControl.State.normal)
            self.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0)
        default:
            break
        }
    }
    
}
