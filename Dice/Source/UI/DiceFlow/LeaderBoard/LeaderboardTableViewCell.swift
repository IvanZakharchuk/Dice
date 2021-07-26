//
//  LeaderboardTableViewCell.swift
//  Dice
//
//  Created by Іван Захарчук on 21.07.2021.
//

import UIKit

class LeaderboardTableViewCell: UITableViewCell {
    
    // MARK: -
    // MARK: IBOutlets
    
    @IBOutlet private var userName: UILabel?
    @IBOutlet private var userScore: UILabel?
    @IBOutlet private var botScore: UILabel?
    
    // MARK: -
    // MARK: Public
    
    public func setupLeaderboardCell(userName: String, userScore: String, botScore: String) {
        self.userName?.text = userName
        self.userScore?.text = userScore
        self.botScore?.text = botScore
        
        self.layer.cornerRadius = 12
    }
}
