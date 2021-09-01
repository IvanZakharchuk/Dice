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
    @IBOutlet private var score: UILabel?
    
    // MARK: -
    // MARK: Public
    
    public func setupLeaderboardCell(userName: String, score: String) {
        self.userName?.text = userName
        self.score?.text = score
        
        self.cornerRadius(radius: 12)
    }
}
