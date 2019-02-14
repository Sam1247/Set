//
//  ShuffleExtension.swift
//  Set
//
//  Created by Abdalla Elsaman on 2/14/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

import Foundation
extension Array {
    public mutating func shuffle () {
        for i in stride(from: count - 1, to: 1, by: -1) {
            let random = Int(arc4random_uniform(UInt32(i+1)))
            if i != random {
                self.swapAt(i, random)
            }
        }
    }
}
