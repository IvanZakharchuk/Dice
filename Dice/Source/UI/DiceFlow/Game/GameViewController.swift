//
//  GameViewController.swift
//  Dice
//
//  Created by Іван Захарчук on 14.07.2021.
//

import UIKit

enum GameViewControllerEvents {
    
    case needDisplayLeaderboard
}

class GameViewController: UIViewController, RootViewGetable {
    
    typealias RootView = GameView
    
    // MARK: -
    // MARK: Properties
    
    public var eventHandler: ((GameViewControllerEvents) -> ())?
    
    private var user: User
    private var bot: Bot
    
    // MARK: -
    // MARK: Initialization
    
    deinit {
        print("deinit")
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
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureGameView()
        self.loadSEmptyDices()
    }
    
    // MARK: -
    // MARK: Public
    
    public func presentLeaderboard() {
        self.eventHandler?(.needDisplayLeaderboard)
    }
    
    // MARK: -
    // MARK: Private
    
    private func configureGameView() {
        self.rootView?.setupView()
        self.rootView?.eventHandler = { [weak self] event in
            self?.handle(event: event)
        }
    }
    
    private func handle(event: GameViewEvents) {
        switch event {
        case .needDisplayLeaderBoard:
            self.presentLeaderboard()
        case .updateDices:
            self.processGame()
        }
    }
    
    private func loadSEmptyDices() {
        let botDice = self.bot.currentPosition
        let userDice = self.user.emptyPosition
        
        self.rootView?.configureScoreView(user: self.user.userName)
        self.rootView?.gameImages(botImage: String(botDice), userImage: String(userDice))
    }
    
    private func processGame() {
        
        let botDice = self.bot.currentDice()
        let userDice = self.user.currentDice()
        
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
        self.rootView?.gameImages(botImage: String(botDice), userImage: String(userDice))
    }
}
