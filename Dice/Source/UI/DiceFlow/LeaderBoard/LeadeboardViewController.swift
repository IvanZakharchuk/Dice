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
        self.playerStorage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cellClass: LeaderboardTableViewCell.self, for: indexPath)

        let playerModel = self.playerStorage.first
        let player = playerModel?.name
        let playerScore = Int(playerModel?.player.score ?? 77)
        let botScore = Int(playerModel?.score ?? 77)
        
        
//        let player = self.playerStorage.compactMap { $0.player.name?.description }[indexPath.row]
//        let playerScore = self.playerStorage.map { $0.playerScore } [indexPath.row]
//        let botScore = self.playerStorage.map { $0.botScore} [indexPath.row]
        
//        let player = self.playerStorage[indexPath.row].name
//        let playerScore = self.playerStorage[indexPath.row].player.score
//        let botScore = self.playerStorage[indexPath.row].player.score

//
//        self.user.name = self.playerStorage?[indexPath.row].name ?? ""
//        let player = self.playerStorage?[indexPath.row].name ?? "user"
//        let scoreUser = self.playerStorage?[indexPath.row].score ?? 0
//        let scoreBot = self.playerStorage?[indexPath.row].score ?? 0
//        print(player)
//
        cell.setupLeaderboardCell(userName: player ?? "user", userScore: String(playerScore) ?? "77", botScore: String(botScore) ?? "77")
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
//            CoreDataManager.shared.deletePlayer(player: playerToDelete)
            self.context.delete(player: playerToDelete)
            self.fetch()
            tableView.reloadData()
            completionHandler(true)
            
        }
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeConfiguration
    }
    
    func fetch() {
//        self.playerStorage = self.context.fetch().map(PlayerModel.init)
//        self.playerStorage = CoreDataManager.shared.getPlayer().map(PlayerModel.init)
    }
}
