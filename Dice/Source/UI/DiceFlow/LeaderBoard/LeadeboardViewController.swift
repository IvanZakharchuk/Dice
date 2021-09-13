//
//  LeadeboardViewController.swift
//  Dice
//
//  Created by Іван Захарчук on 16.07.2021.
//

import UIKit
import CoreData

enum LeaderboardViewControllerEvents {
    
    case back
    case refreshModelToGame(Player)
}

class LeadeboardViewController: BaseViewController<LeaderboardView, LeaderboardViewEvents, LeaderboardViewControllerEvents>, RootViewGetable {

    typealias RootView = LeaderboardView
    
    // MARK: -
    // MARK: Properties
        
    private var user: Player
    private var bot: Player
    private let context: CRUD
    private var users: [Player]
    
    // MARK: -
    // MARK: Initialization
    
    public init(user: Player, bot: Player, context: CRUD) {
        self.user = user
        self.bot = bot
        self.context = context
        self.users = context.read()
        
        super.init(nibName: nil, bundle: nil)
        
        self.prepareData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    public func refreshData() -> Player {
//        self.user
//    }
    
    // MARK: -
    // MARK: Private
    
    private func prepareData() {
        let current = self.user
        let bot = self.bot
        
        self.users.removeAll { $0 == bot || $0 == current }
        
        self.users = [bot, current] + self.users
    }
    
    // MARK: -
    // MARK: Overrided
    
    internal override func configureView() {
        super.configureView()
    }
}

extension LeadeboardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cellClass: LeaderboardTableViewCell.self, for: indexPath)
        let user = self.users[indexPath.row]
        cell.setupLeaderboardCell(userName: user.name, score: user.score.description)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            let user = self.users[indexPath.row]
            
            self.context.delete(player: user)
            self.users.removeAll { $0 == user }
            
            user.score = user.emptyPosition
            self.eventHandler?(.refreshModelToGame(user))
            
            tableView.reloadData()
            completionHandler(true)
        }
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeConfiguration
    }
}
