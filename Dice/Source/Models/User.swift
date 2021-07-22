//
//  Dice.swift
//  Dice
//
//  Created by Іван Захарчук on 13.07.2021.
//

import Foundation

class User {
    
    // MARK: -
    // MARK: Properties
    
    public var userName = ""
    public var currentPosition = 0 
    public let emptyPosition = 0 
    
    public var dice: Dices
    
    // MARK: -
    // MARK: Initialization
    
    public init(dice: Dices) {
        self.dice = dice
    }
    
    // MARK: -
    // MARK: Private
    
    public func currentDice() -> Int {
        self.currentPosition = self.dice.random()
        return currentPosition
    }
}
