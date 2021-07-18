//
//  Dices.swift
//  Dice
//
//  Created by Іван Захарчук on 19.07.2021.
//

import Foundation
import UIKit

struct Dices {
    
    let dices = ["1",
                 "2",
                 "3",
                 "4",
                 "5",
                 "6"
    ]
    
    func randomDice() -> String {
        self.dices.randomElement() ?? "0"
    }
}
