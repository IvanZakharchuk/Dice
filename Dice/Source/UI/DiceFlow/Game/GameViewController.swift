//
//  GameViewController.swift
//  Dice
//
//  Created by Іван Захарчук on 14.07.2021.
//

import UIKit
import CoreData

enum GameViewControllerEvents {
    
    case needDisplayLeaderboard(Player, Player, Fetchable & Storable)
}

class GameViewController: BaseViewController<GameViewEvents, GameViewControllerEvents>, RootViewGetable {
    
    typealias RootView = GameView
    
    // MARK: -
    // MARK: Properties
    
    private var user: Player
    private var bot: Player
    private var playerStorage: [PlayerModel] = []
    private let context: Fetchable & Storable

    // MARK: -
    // MARK: Initialization
    
    public init(user: Player, bot: Player, context: Fetchable & Storable) {
        self.user = user
        self.bot = bot
        self.context = context
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Public
    
    public func presentLeaderboard(user: Player, bot: Player, context: Fetchable & Storable) {
        self.eventHandler?(.needDisplayLeaderboard(user, bot, context))
    }
    
    // MARK: -
    // MARK: Private
    
    private func loadEmptyDices() {
        let botDice = self.bot.emptyPosition
        let userDice = self.user.emptyPosition
//        let rootView = self.rootView
        
        self.rootView?.configureScoreView(user: self.user.name)
        self.rootView?.scoreViewUpdate(botScore: String(self.bot.score), userScore: String(self.user.score))
        self.rootView?.setupGameameImages(botImage: botDice.description, userImage: userDice.description)
    }
    
    private func processGame() {
        self.bot.shuffleDice()
        self.user.shuffleDice()
        
        let botDice = self.bot.currentPosition
        let userDice = self.user.currentPosition
        
        if botDice > userDice {
            self.bot.score += 1
            self.alertWithTimer(title: BaseTexts.botWin.rawValue)
        } else if botDice < userDice {
            self.user.score += 1
            self.alertWithTimer(title: self.user.name + BaseTexts.win.rawValue)
        } else if botDice == userDice {
            self.alertWithTimer(title: BaseTexts.standOff.rawValue)
        }
        
        self.rootView?.scoreViewUpdate(botScore: String(self.bot.score), userScore: String(self.user.score))
        self.saveToCoreData(scoreUser: self.user.score, scoreBot: self.bot.score)
        
        self.rootView?.setupGameameImages(botImage: String(botDice), userImage: String(userDice))
    }
    
    private func alertWithTimer(title: String) {
        DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
            self.showAlert(title: title)
        })
    }

    private func saveToCoreData(scoreUser: Int, scoreBot: Int) {
//        let newPlayer = CoreDataPlayer(context: CoreDataManager.shared.persistentContainer.viewContext)
//        let newPlayer = self.playerStorage.map { $0.player }
//        let newPlayer = self.context.fetch()
//        newPlayer.map { $0.name = "Bot"}
//        let newPlayer = self.playerStorage[1].player
        let newPlayer = self.playerStorage.map { $0.player }
        newPlayer.map { $0.score = Int16(scoreBot) }
//        let score = self.playerStorage.map { $0.player }
//        newPlayer.name = "Bot"
//        newPlayer.score = Int16(scoreUser)
//        newPlayer.score = Int16(scoreBot)
        
//        print(newPlayer.score)
        
        self.context.saveContext(player: newPlayer)
        
//        CoreDataManager.shared.saveContext(player: <#CoreDataPlayer#>)
    }
    
//    private func fetch() {
//        self.playerStorage = self.context.fetch().map(PlayerModel.init)
//    }
    
    // MARK: -
    // MARK: Overrided
    
    internal override func configureView() {
        super.configureView()
        
        self.loadEmptyDices()
    }
    
    internal override func handle(event: GameViewEvents) {
        switch event {
        case .needDisplayLeaderBoard:
            self.presentLeaderboard(user: self.user, bot: self.bot, context: self.context)
        case .updateDices:
            self.processGame()
        }
    }
}
