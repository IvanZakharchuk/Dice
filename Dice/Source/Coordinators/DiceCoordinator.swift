//
//  DiceCoordinator.swift
//  Dice
//
//  Created by Іван Захарчук on 13.07.2021.
//

import Foundation
import UIKit

class DiceCoordinator: BaseCoordinator {

    let context: Fetchable & Storable

    init(context: Fetchable & Storable) {
        self.context = context

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Private
    
    private func presentLogin() {
        let dice = Dices()
        let user = Player(dice: dice)
        let controller = LoginViewController(user: user, context: context)
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
    
    private func presentGame(user: Player, context: Fetchable & Storable) {
        let dice = Dices()
        let bot = Player(dice: dice)
        let controller = GameViewController(user: user, bot: bot, context: context)
        controller.eventHandler = { [weak self] event in
            self?.handle(event: event)
        }
        self.pushViewController(controller, animated: true)
    }
    
    private func handle(event: GameViewControllerEvents) {
        switch event {
        case let .needDisplayLeaderboard(user, bot, context):
            self.presentLeaderBoard(user: user, bot: bot, context: context)
        }
    }
    
    private func presentLeaderBoard(user: Player, bot: Player, context: Fetchable & Storable) {
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
        }
    }
    
    // MARK: -
    // MARK: Ovverided
    
    override func prepare() {
        self.presentLogin()
    }
}
