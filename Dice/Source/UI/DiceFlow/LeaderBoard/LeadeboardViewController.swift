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
}

class LeadeboardViewController: BaseViewController<LeaderboardViewEvents, LeaderboardViewControllerEvents>, RootViewGetable {

    typealias RootView = LeaderboardView
    
    // MARK: -
    // MARK: Properties
        
    private var user: Player
    private var bot: Player
    private var coreDataPlayer:[CoreDataPlayer]?
    private let context: CRUD
    
    // MARK: -
    // MARK: Initialization
    
    public init(user: Player, bot: Player, context: CRUD) {
        self.user = user
        self.bot = bot
        self.context = context
      
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Overrided
    
    internal override func configureView() {
        super.configureView()
        
        self.fetch()
    }
}

extension LeadeboardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.context.read().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cellClass: LeaderboardTableViewCell.self, for: indexPath)
        
        guard let player = self.context.read().first(where: {$0.name == user.name}) else {
            return cell
        }
        
        let name = player.name ?? "userDefault"
        let score = String(player.score)
        
        cell.setupLeaderboardCell(userName: name, score: score)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            
            self.fetch()
            tableView.reloadData()
            completionHandler(true)
            
        }
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeConfiguration
    }
    
    private func fetch() {
        self.context.read()
        
    }
}
