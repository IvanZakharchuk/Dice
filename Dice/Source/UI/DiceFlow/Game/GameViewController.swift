//
//  GameViewController.swift
//  Dice
//
//  Created by Іван Захарчук on 14.07.2021.
//

import UIKit

enum GameViewControllerEvents {
    
    case needDisplayLeaderboard(User, User)
}

class GameViewController: BaseViewController, RootViewGetable {
    
    typealias RootView = GameView
    
    // MARK: -
    // MARK: Properties
    
    public var eventHandler: ((GameViewControllerEvents) -> ())?
    
    private var user: User
    private var bot: User
    
    // MARK: -
    // MARK: Initialization
    
    deinit {
        print("deinit GameVC")
    }
    
    public init(user: User, bot: User) {
        self.user = user
        self.bot = bot
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Public
    
    public func presentLeaderboard(user: User, bot: User) {
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
        case let .showAlert(alertController):
            self.alert(alertController: alertController)
        }
    }
    
    private func loadEmptyDices() {
        let botDice = self.bot.currentPosition
        let userDice = self.user.emptyPosition
        self.user.score = 0
        
        self.rootView?.configureScoreView(user: self.user.name)
        self.rootView?.scoreViewUpdate(botScore: String(self.bot.score), userScore: String(self.user.score))
        self.rootView?.setupGameameImages(botImage: String(botDice), userImage: String(userDice))
    }
    
    private func processGame() {
        self.bot.shuffleDice()
        self.user.shuffleDice()
        
        let botDice = self.bot.currentPosition
        let userDice = self.user.currentPosition
        
        if botDice > userDice {
            self.bot.score += 1
            self.rootView?.showAlert(title: "Bot Win")
        } else if botDice < userDice {
            self.user.score += 1
            self.rootView?.showAlert(title: self.user.name + " Win")
        } else if botDice == userDice {
            self.rootView?.showAlert(title: "Stand off")
        }
        
        self.rootView?.scoreViewUpdate(botScore: String(self.bot.score), userScore: String(self.user.score))
        self.rootView?.setupGameameImages(botImage: String(botDice), userImage: String(userDice))
    }
    
    private func alert(alertController: UIAlertController) {
        self.present(alertController, animated: true, completion: nil)
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
