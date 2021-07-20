//
//  Dices.swift
//  Dice
//
//  Created by Іван Захарчук on 19.07.2021.
//

import Foundation
import UIKit

struct Dices {
    
    private let dice = [1, 2 ,3, 4, 5, 6]
    
    public func random() -> Int {
        self.dice.randomElement() ?? 0
    }
}
