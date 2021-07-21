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

class LeaderboardView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: -
    // MARK: Properties
    
    public var eventHandler: ((LeadeboardViewEnvents) -> ())?

    
    let cell = LeaderboardTableViewCell()
    
    // MARK: -
    // MARK: IBOutlets
    
    @IBOutlet private var leaderboardTableView: UITableView?
    
    // MARK: -
    // MARK: Public
    
    public func setupView() {
        self.backgroundColor = UIColor(patternImage: UIImage(named: "background") ?? UIImage())
        
        let nib = UINib(nibName: "LeaderboardTableViewCell", bundle: nil)
        self.leaderboardTableView?.register(nib, forCellReuseIdentifier: "LeaderboardTableViewCell")
    }
    
    // MARK: -
    // MARK: TableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // MARK: -
    // MARK: TableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaderboardTableViewCell", for: indexPath) as! LeaderboardTableViewCell
        
        self.eventHandler?(.leaderBoardTableViewFill)
        
        return cell
    }
    
    
    // MARK: -
    // MARK: Public
    
    public func tableViewUpdate(userName: String, userScore: String, botScore: String) {
        self.cell.setupLeaderboardCell(userName: userName, userScore: userScore, botScore: botScore)
    }
    
    public func tableViewNunberOfSections(user: Int) {
        
    }
    
    // MARK: -
    // MARK: Private
    
}
