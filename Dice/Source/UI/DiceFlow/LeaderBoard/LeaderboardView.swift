//
//  LeaderboardView.swift
//  Dice
//
//  Created by Іван Захарчук on 16.07.2021.
//

import Foundation
import UIKit

enum LeaderboardViewEvents {
    case back
}

// делегат и дата сорс в контрллере(есть)

class LeaderboardView: BaseView {
    
    // MARK: -
    // MARK: IBOutlets
    
    @IBOutlet private var leaderboardTableView: UITableView?
    
    // MARK: -
    // MARK: Public
    
    public override func setupView() {
        self.backgroundColor = UIColor(patternImage: UIImage(named: "background") ?? UIImage())
    }
}
