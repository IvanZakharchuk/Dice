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
//    public var scoreView: ScoreView
    
    // MARK: -
    // MARK: Initialization
    
    deinit {
        print("deinit")
    }
    
    public init(user: User) {
        self.user = user
        
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
        self.rootView?.eventHandler = { [weak self] event in
            self?.handle(event: event)
        }
    }
    
    private func handle(event: GameViewEvents) {
        switch event {
        case let .scoreViewUserName(user):
            self.rootView?.scoreViewUpdate(user: user)
        case .needDisplayLeaderBoard:
            self.presentLeaderboard()
        }
    }
    
    private func updateScoreView(user: String) {
//        self.scoreView.setupScoreView(user: self.user.userName)
        self.rootView?.score.setupScoreView(user: self.user.userName)
    }
    
}
