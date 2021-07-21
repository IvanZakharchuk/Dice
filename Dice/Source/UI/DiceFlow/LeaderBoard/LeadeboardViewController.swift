//
//  LeadeboardViewController.swift
//  Dice
//
//  Created by Іван Захарчук on 16.07.2021.
//

import UIKit

enum LeaderboardViewControllerEvents {
    
    case back
}

class LeadeboardViewController: BaseViewController, RootViewGetable {
    
    typealias RootView = LeaderboardView
    
    // MARK: -
    // MARK: Properties
    
    public var eventHandler: ((LeaderboardViewControllerEvents) -> ())?
    
    private var user: User
    private var bot: Bot
    
    // MARK: -
    // MARK: Initialization
    
    deinit {
        print("deinit LeaderboardVC")
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
    
    // MARK: -
    // MARK: Pvivate
    
    private func handle(event: LeadeboardViewEnvents) {
        switch event {
        case .leaderBoardTableViewFill:
            self.rootView?.numberOfRows(numberOfRows: 10)
            self.rootView?.tableViewUpdate(
                userName: self.user.userName,
                userScore: String(self.user.currentDice()),
                botScore: String(self.bot.currentDice())
            )
        }
    }
    
    // MARK: -
    // MARK: Overrided
    
    internal override func configureView() {
        self.rootView?.setupView()
        self.rootView?.eventHandler = { [weak self] event in
            self?.handle(event: event)
        }
    }
}
