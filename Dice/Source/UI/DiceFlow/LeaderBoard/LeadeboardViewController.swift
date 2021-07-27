//
//  LeadeboardViewController.swift
//  Dice
//
//  Created by Іван Захарчук on 16.07.2021.
//

import UIKit

enum LeaderboardViewControllerEvents {
    
    case back
}

class LeadeboardViewController: BaseViewController, RootViewGetable {
    
    typealias RootView = LeaderboardView
    
    // MARK: -
    // MARK: Properties
    
    public var eventHandler: ((LeaderboardViewControllerEvents) -> ())?
    
    private var user: Player
    private var bot: Player
    
    // MARK: -
    // MARK: Initialization
    
    public init(user: Player, bot: Player) {
        self.user = user
        self.bot = bot
      
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Overrided
    
    internal override func configureView() {
        self.rootView?.setupView()
    }
}

extension LeadeboardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func registeCell() {
        self.leaderBoardTableView?.register(cell: "LeaderboardTableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaderboardTableViewCell", for: indexPath) as! LeaderboardTableViewCell
        
//        let cell = tableView.register(cell: "LeaderboardTableViewCell")
        let cell = tableView.dequeueReusableCell(withCellClass: LeaderboardTableViewCell.self, for: indexPath) 
        
        
        cell.setupLeaderboardCell(userName: self.user.name, userScore: String(self.user.score), botScore: String(self.bot.score) )
        
        return cell
    }
    
    
}
