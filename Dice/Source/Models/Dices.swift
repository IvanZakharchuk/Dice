//
//  Dices.swift
//  Dice
//
//  Created by Іван Захарчук on 19.07.2021.
//

import Foundation
import UIKit

struct Dices {
    
//    let dicesString = ["1",
//                 "2",
//                 "3",
//                 "4",
//                 "5",
//                 "6"
//    ]
//
//    func randomDice() -> String {
//        self.dicesString.randomElement() ?? "0"
//    }
    
    let dice = [1, 2 ,3, 4, 5, 6]
    
    func random() -> Int {
        self.dice.randomElement() ?? 0
    }
}
