//
//  Bot.swift
//  Dice
//
//  Created by Іван Захарчук on 19.07.2021.
//

import Foundation

class Bot {
    
    // MARK: -
    // MARK: Properties
    
    public var currentPosition = 0
    
    public var score = 0
    
    public var dice: Dices
    
    // MARK: -
    // MARK: Initialization
    
    public init(dice: Dices) {
        self.dice = dice
    }
    
    // MARK: -
    // MARK: Private
    
    public func currentDice() {
        self.currentPosition = self.dice.random()
    }
}
