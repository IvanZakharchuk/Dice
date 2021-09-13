//
//  DiceCoordinator.swift
//  Dice
//
//  Created by Іван Захарчук on 13.07.2021.
//

import Foundation
import UIKit

class DiceCoordinator: BaseCoordinator {
    
    // MARK: -
    // MARK: Properties

    let context: CRUD

    private weak var gameViewController: GameViewController?
    
    // MARK: -
    // MARK: Initialization
    
    init(context: CRUD) {
        self.context = context

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Private
    
    private func presentLogin() {
        let controller = LoginViewController(context: self.context)
        controller.eventHandler = { [weak self] event in
            self?.handle(event: event)
        }
        self.pushViewController(controller, animated: true)
    }
    
    private func handle(event: LoginViewControllerEvents) {
        switch event {
        case let .needDisplayGame(user, context):
            self.presentGame(user: user, context: context)
        }
    }
    
    private func presentGame(user: Player, context: CRUD) {
        let controller = GameViewController(user: user, context: context)
        controller.eventHandler = { [weak self] event in
            self?.handle(event: event)
        }
        self.gameViewController = controller
        self.pushViewController(controller, animated: true)
    }
    
    private func handle(event: GameViewControllerEvents) {
        switch event {
        case let .needDisplayLeaderboard(user, bot, context):
            self.presentLeaderBoard(user: user, bot: bot, context: context)
        }
    }
    
    private func presentLeaderBoard(user: Player, bot: Player, context: CRUD) {
        let controller = LeadeboardViewController(user: user, bot: bot, context: context)
        controller.eventHandler = { [weak self] event in
            self?.handle(event: event)
        }
        self.present(controller, animated: true, completion: nil)
    }
    
    private func handle(event: LeaderboardViewControllerEvents) {
        switch event {
        case .back:
            self.dismiss(animated: true, completion: nil)
        case let .refreshModelToGame(user):
            self.gameViewController?.refreshModelFromLeadreboard(user: user)
        }
    }
    
    // MARK: -
    // MARK: Ovverided
    
    override func prepare() {
        self.presentLogin()
    }
}
