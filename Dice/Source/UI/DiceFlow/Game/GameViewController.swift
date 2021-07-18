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
    
    private var dices: Dices
    
    
    // MARK: -
    // MARK: Initialization
    
    deinit {
        print("deinit")
    }
    
    public init(user: User, dices: Dices) {
        self.user = user
        self.dices = dices
        
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
        self.rootView?.scoreViewUpdate(user: self.user.userName)
        
        self.rootView?.eventHandler = { [weak self] event in
            self?.handle(event: event)
        }
    }
    
    private func handle(event: GameViewEvents) {
        switch event {
        case .needDisplayLeaderBoard:
            self.presentLeaderboard()
        case .updateDices:
            self.setuoDiceImage()
        }
    }
    
//    // MARK: -
//    // MARK: GameLogic
    
    private func setuoDiceImage() {
        self.rootView?.gameLogic(botImage: dices.randomDice(), userImage: dices.randomDice())
    }
    
    private func compareDices() {
        self.dices.dicesString.compactMap { Int($0)}
        
        
    }
}
