//
//  LeaderboardView.swift
//  Dice
//
//  Created by Іван Захарчук on 16.07.2021.
//

import Foundation
import UIKit

enum LeadeboardViewEnvents {
    
    case leaderBoardTableViewFill
}

class LeaderboardView: UIView {
    
    // MARK: -
    // MARK: Properties
    
    public var eventHandler: ((GameViewEvents) -> ())?
    
    // MARK: -
    // MARK: IBOutlets
    
    // table view conect
    
    // MARK: -
    // MARK: Public
    
    public func setupView() {
        self.backgroundColor = UIColor(patternImage: UIImage(named: "background") ?? UIImage())
    }
    // MARK: -
    // MARK: Private
    
}
