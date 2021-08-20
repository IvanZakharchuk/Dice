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
    private var fetchResultController: NSFetchedResultsController<Player>?
    
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
        super.configureView()
        
        self.fetchData()
    }
}

extension LeadeboardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.coreData?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cellClass: LeaderboardTableViewCell.self, for: indexPath)
//        self.fetchData()
        
        self.user.name = self.coreData?[indexPath.row].name ?? ""
        let player = self.coreData?[indexPath.row].name ?? "user"
        let scoreUser = self.coreData?[indexPath.row].scoreUser ?? 0
        let scoreBot = self.coreData?[indexPath.row].scoreBot ?? 0
        print(player)
        
        cell.setupLeaderboardCell(userName: player, userScore: String(scoreUser), botScore: String(scoreBot) )
        
        return cell 
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
//            let userToDelete = self.fetchResultController?.object(at: indexPath)
            let userToDelete = self.coreData?[indexPath.row]
//            self.context?.delete(userToDelete ?? DiceStorage())
            self.context?.delete(userToDelete ?? Player())
            completionHandler(true)
            self.fetchData()
            tableView.reloadData()
        }
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
            
        return swipeConfiguration
    }
    
    func fetchData() {
        do {
            self.coreData = try self.context?.fetch(Player.fetchRequest())
//            let a = self.coreData?[0].name
        }
        catch {
            
        }
    }
}
