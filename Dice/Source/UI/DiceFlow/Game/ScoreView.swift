//
//  ScoreView.swift
//  Dice
//
//  Created by Іван Захарчук on 14.07.2021.
//

import Foundation
import UIKit

class ScoreView: NibDesignable {
    
    // MARK: -
    // MARK: Outlets
    
    @IBOutlet private var botLabel: UILabel?
    @IBOutlet private var userLabel: UILabel?
    @IBOutlet private var botScore: UILabel?
    @IBOutlet private var userScore: UILabel?
    
    // MARK: -
    // MARK: Public
    
    public func setupScoreView(botScore: String, userScore: String) {
        self.botScore?.text = botScore
        self.userScore?.text = userScore
    }
    
    public func configureScoreView(user: String) {
        self.userLabel?.text = user
        self.cornerRadius(radius: 15)
    }
}

// реюзабл в'ю
// ниб дизайнебл на луа 
