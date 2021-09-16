//
//  Dice.swift
//  Dice
//
//  Created by Іван Захарчук on 13.07.2021.
//

import Foundation
import CoreData
import UIKit

class Player: Equatable {
    
    // MARK: -
    // MARK: Properties

    public var name = ""
    public var currentPosition = 0
    public let emptyPosition = 0
    public var score = 0
    
    public let dice = Dices()

    // MARK: -
    // MARK: Initialization
    
    public init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
    
    // MARK: -
    // MARK: Private
    
    public func shuffleDice() {
        self.currentPosition = self.dice.random()
    }
    
    // MARK: -
    // MARK: Equatable
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.name == rhs.name && lhs.score == rhs.score
    }
}
