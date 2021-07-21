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
    
    private var userName = ""
    private var userScore = ""
    private var botScore = ""
    private var numberOfRows = 0

    // MARK: -
    // MARK: IBOutlets
    
    @IBOutlet private var leaderboardTableView: UITableView?
    
    // MARK: -
    // MARK: Public
    
    public func setupView() {
        self.backgroundColor = UIColor(patternImage: UIImage(named: "background") ?? UIImage())
        
        let nib = UINib(nibName: "LeaderboardTableViewCell", bundle: nil)
        self.leaderboardTableView?.register(nib, forCellReuseIdentifier: "LeaderboardTableViewCell")
        
        self.eventHandler?(.leaderBoardTableViewFill)
    }
    
    // MARK: -
    // MARK: TableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // MARK: -
    // MARK: TableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.eventHandler?(.leaderBoardTableViewFill)
        
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.eventHandler?(.leaderBoardTableViewFill)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaderboardTableViewCell", for: indexPath) as! LeaderboardTableViewCell
        cell.setupLeaderboardCell(userName: self.userName, userScore: self.userScore, botScore: self.botScore )
       
        return cell
    }
    
    
    // MARK: -
    // MARK: Public
    
    public func tableViewUpdate(userName: String, userScore: String, botScore: String) {
        self.userName = userName
        self.userScore = userScore
        self.botScore = botScore
    }
    
    
    public func numberOfRows(numberOfRows: Int) {
        self.numberOfRows = numberOfRows
    }
    
    // MARK: -
    // MARK: Private
    
    private func updateCell() {
        
    }
    
}
