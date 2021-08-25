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
    private var playerStorage: [PlayerModel] = []
//    private var fetchResultController: NSFetchedResultsController<Player>?
    
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
        self.playerStorage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cellClass: LeaderboardTableViewCell.self, for: indexPath)
        self.fetchData()
        
        let player = self.playerStorage[indexPath.row].name
        
        let playerScore = self.playerStorage[indexPath.row].player.score
        let botScore = self.playerStorage[indexPath.row].player.score
        
        
//        self.user.name = self.playerStorage?[indexPath.row].name ?? ""
//        let player = self.playerStorage?[indexPath.row].name ?? "user"
//        let scoreUser = self.playerStorage?[indexPath.row].score ?? 0
//        let scoreBot = self.playerStorage?[indexPath.row].score ?? 0
//        print(player)
//
        cell.setupLeaderboardCell(userName: player, userScore: String(playerScore), botScore: String(botScore) )
//
        return cell 
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            
//            func delete(_ playerToDelete: PlayerModel) {
//                let existingPlayer = CoreDataManager.shared.getPlayerkById(id: playerToDelete.id)
//                if let existingPlayer = existingPlayer {
//                    CoreDataManager.shared.deletePlayer(player: existingPlayer)
//                }
//            }
            
            let playerToDelete = self.playerStorage[indexPath.row].player
            CoreDataManager.shared.deletePlayer(player: playerToDelete)
            
            self.fetchData()
            tableView.reloadData()
            
            
//            let userToDelete = self.fetchResultController?.object(at: indexPath)
//            let userToDelete = self.playerStorage?[indexPath.row]
////            self.context?.delete(userToDelete ?? DiceStorage())
//            self.context?.delete(userToDelete ?? CoreDataPlayer())
            completionHandler(true)
            
        }
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
            
        
        return swipeConfiguration
        
    }
    
    func fetchData() {
    
    self.playerStorage = CoreDataManager.shared.getPlayer().map(PlayerModel.init)
//        do {
//            self.playerStorage = try self.context?.fetch(CoreDataPlayer.fetchRequest())
////            let a = self.coreData?[0].name
//        }
//        catch {
//
//        }
    }

}
