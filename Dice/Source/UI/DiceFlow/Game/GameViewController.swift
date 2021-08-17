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

class GameViewController: BaseViewController<GameViewEvents, GameViewControllerEvents>, RootViewGetable {
    
    typealias RootView = GameView
    
    // MARK: -
    // MARK: Properties
    
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
    
    private func loadEmptyDices() {
        let botDice = self.bot.emptyPosition
        let userDice = self.user.emptyPosition
//        let root = self.rootView.self
//
////        let rootView = self.rootView?.
//        self.user.score = 0
//        //
//
////        var gameView = self.rootView
//        root.configureScoreView
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
            self.alertWithTimer(title: BaseTexts.botWin.rawValue)
        } else if botDice < userDice {
            self.user.score += 1
            self.alertWithTimer(title: self.user.name + BaseTexts.win.rawValue)
        } else if botDice == userDice {
            self.alertWithTimer(title: BaseTexts.standOff.rawValue)
        }
        
        self.rootView?.scoreViewUpdate(botScore: String(self.bot.score), userScore: String(self.user.score))
        self.rootView?.setupGameameImages(botImage: String(botDice), userImage: String(userDice))
    }
    
    private func alertWithTimer(title: String) {
        DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
            self.showAlert(title: title)
        })
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
            self.presentLeaderboard(user: self.user, bot: self.bot)
        case .updateDices:
            self.processGame()
        }
    }
}
