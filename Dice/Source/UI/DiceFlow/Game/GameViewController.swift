//
//  GameViewController.swift
//  Dice
//
//  Created by Іван Захарчук on 14.07.2021.
//

import UIKit

enum GameViewControllerEvents {
    
    case needDisplayLeaderboard(Player, Player)
}

class GameViewController: BaseViewController, RootViewGetable {
    
    typealias RootView = GameView
    
    // MARK: -
    // MARK: Properties
    
    public var eventHandler: ((GameViewControllerEvents) -> ())?
    
    private var user: Player
    private var bot: Player
    
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
    // MARK: Public
    
    public func presentLeaderboard(user: Player, bot: Player) {
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
        let botDice = self.bot.emptyPosition
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
            self.showAlert(title: BaseTexts.botWin.rawValue)
        } else if botDice < userDice {
            self.user.score += 1
            self.showAlert(title: self.user.name + BaseTexts.win.rawValue)
        } else if botDice == userDice {
            self.showAlert(title: BaseTexts.standOff.rawValue)
        }
        
        self.rootView?.scoreViewUpdate(botScore: String(self.bot.score), userScore: String(self.user.score))
        self.rootView?.setupGameameImages(botImage: String(botDice), userImage: String(userDice))
    }
    
    private func showAlert(title: String) {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "OK", style: .default) { (action) in }
        
        alertController.addAction(confirmAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: -
    // MARK: Overrided
    
    internal override func configureView() {
//        self.rootView?.setupView()
        self.loadEmptyDices()
        self.rootView?.eventHandler = { [weak self] event in
            self?.handle(event: event)
        }
    }
}
