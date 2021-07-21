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
    // MARK: Private
    
    private func presentLogin() {
        let dice = Dices()
        let user = User(dice: dice)
        let controller = LoginViewController(user: user)
        controller.eventHandler = { [weak self] event in
            self?.handle(event: event)
        }
        self.pushViewController(controller, animated: true)
    }
    
    private func handle(event: LoginViewControllerEvents) {
        switch event {
        case let .needDisplayGame(user):
            self.presentGame(user: user)
        }
    }
    
    private func presentGame(user: User) {
        let dice = Dices()
        let bot = Bot(dice: dice)
        let controller = GameViewController(user: user, bot: bot)
        controller.eventHandler = { [weak self] event in
            self?.handle(event: event)
        }
        self.pushViewController(controller, animated: true)
    }
    
    private func handle(event: GameViewControllerEvents) {
        switch event {
        case let .needDisplayLeaderboard(user, bot):
            self.presentLeaderBoard(user: user, bot: bot)
        }
    }
    
    private func presentLeaderBoard(user: User, bot: Bot) {
        let controller = LeadeboardViewController(user: user, bot: bot)
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
