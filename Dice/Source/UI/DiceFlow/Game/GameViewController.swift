//
//  GameViewController.swift
//  Dice
//
//  Created by Іван Захарчук on 14.07.2021.
//

import UIKit

enum GameViewControllerEvents {
    
    case needDisplayLeaderboard(User, Bot)
}

class GameViewController: BaseViewController, RootViewGetable {
    
    typealias RootView = GameView
    
    // MARK: -
    // MARK: Properties
    
    public var eventHandler: ((GameViewControllerEvents) -> ())?
    
    private var user: User
    private var bot: Bot
    
    // MARK: -
    // MARK: Initialization
    
    deinit {
        print("deinit GameVC")
    }
    
    public init(user: User, bot: Bot) {
        self.user = user
        self.bot = bot
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Public
    
    public func presentLeaderboard(user: User, bot: Bot) {
        self.eventHandler?(.needDisplayLeaderboard(user, bot))
    }
    
    // MARK: -
    // MARK: Private
    
    private func handle(event: GameViewEvents) {
        switch event {
        case .needDisplayLeaderBoard:
            self.presentLeaderboard(user: self.user, bot: self.bot)
        case .updateDices:
            self.processGame()
        }
    }
    
    private func loadEmptyDices() {
        let botDice = self.bot.currentPosition
        let userDice = self.user.emptyPosition
        
        self.rootView?.configureScoreView(user: self.user.userName)
        self.rootView?.setupGameameImages(botImage: String(botDice), userImage: String(userDice))
    }
    
    private func processGame() {
        
        self.bot.currentDice()
        self.user.currentDice()
        
        let botDice = self.bot.currentPosition
        let userDice = self.user.currentPosition
//        let botDice = self.bot.currentDice()
//        let userDice = self.user.currentDice()
        
        if botDice > userDice {
            print("BotWin")
            // TODO: alert to root view
        } else if botDice < userDice {
            print("UserWin")
            
        } else if botDice == userDice {
            print("Stand off")
        }
        
        print(botDice)
        print(userDice)
        
        
        self.rootView?.scoreViewUpdate(botScore: String(botDice), userScore: String(userDice))
        self.rootView?.setupGameameImages(botImage: String(botDice), userImage: String(userDice))
    }
    
    // MARK: -
    // MARK: Overrided
    
    internal override func configureView() {
        self.rootView?.setupView()
        self.loadEmptyDices()
        self.rootView?.eventHandler = { [weak self] event in
            self?.handle(event: event)
        }
    }
}
