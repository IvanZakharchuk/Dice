//
//  GameViewController.swift
//  Dice
//
//  Created by Іван Захарчук on 14.07.2021.
//

import UIKit
import CoreData

enum GameViewControllerEvents {
    
    case needDisplayLeaderboard(Player, Player, CRUD)
}

class GameViewController: BaseViewController<GameView, GameViewEvents, GameViewControllerEvents>, RootViewGetable {
    
    typealias RootView = GameView
    
    // MARK: -
    // MARK: Properties
    
    private var user: Player
    private var bot: Player
    private let context: CRUD


    // MARK: -
    // MARK: Initialization
    
    public init(user: Player, context: CRUD) {
        self.user = user
        self.bot = context.read(name: "Bot") ?? Player(name: "Bot", score: 0)
        context.update(player: self.bot)
        
        self.context = context
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Public

    public func refreshModelFromLeadreboard(user: Player) {
        if self.user.name == user.name {
            self.user = user
        } else if self.bot.name == user.name {
            self.bot = user
        }
        self.rootView?.scoreViewUpdate(botScore: String(self.bot.score), userScore: String(self.user.score))
    }
        
    // MARK: -
    // MARK: Private
    
    private func loadEmptyDices() {
        let botDice = self.bot.emptyPosition
        let userDice = self.user.emptyPosition
        let rootView = self.rootView
        
        rootView?.configureScoreView(user: self.user.name)
        rootView?.scoreViewUpdate(botScore: String(self.bot.score), userScore: String(self.user.score))
        rootView?.setupGameImages(botImage: botDice.description, userImage: userDice.description)
    }
    
    private func processGame() {
        self.bot.shuffleDice()
        self.user.shuffleDice()
        
        let botDice = self.bot.currentPosition
        let userDice = self.user.currentPosition
        
        if botDice > userDice {
            self.bot.score += 1
        } else if botDice < userDice {
            self.user.score += 1
        }
        
        self.rootView?.scoreViewUpdate(botScore: String(self.bot.score), userScore: String(self.user.score))
        self.rootView?.setupGameImages(botImage: String(botDice), userImage: String(userDice))
        
        self.saveToCoreData(player: self.user, bot: self.bot)
    }
    
    private func saveToCoreData(player: Player, bot: Player) {
        let context = self.context
        
        context.update(player: player)
        context.update(player: bot)
    }
    
    // MARK: -
    // MARK: Overrided
    
    internal override func configureView() {
        super.configureView()
        
        self.loadEmptyDices()
    }
    
    internal override func handle(event: GameViewEvents) {
        switch event {
        case .needDisplayLeaderBoard:
            self.eventHandler?(.needDisplayLeaderboard(user, bot, context))
        case .updateDices:
            self.processGame()
        }
    }
}
