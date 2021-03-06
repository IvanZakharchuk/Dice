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
        self.setupNavigation()
        let controller = LoginViewController(user: User())
        controller.eventHandler = { [weak self] event in
            self?.handle(event: event)
        }
        self.pushViewController(controller, animated: true)
    }
    
    private func handle(event: LoginViewControllerEvents) {
        switch event {
        case .needDisplayGame:
            self.presentGame()
        }
    }
    
    private func presentGame() {
        self.setupNavigation()
        let user = User()
        let dices = Dices()
        let controller = GameViewController(user: user, dices: dices)
        controller.eventHandler = { [weak self] event in
            self?.handle(event: event)
        }
        self.pushViewController(controller, animated: true)
    }
    
    private func handle(event: GameViewControllerEvents) {
        switch event {
        case .needDisplayLeaderboard:
            self.presentLeaderBoard()
        }
    }
    
    private func presentLeaderBoard() {
        self.setupNavigation()
        let user = User()
        let controller = LeadeboardViewController(user: user)
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
    
    private func setupNavigation() {
        navigationItem.hidesBackButton = true
        navigationItem.backBarButtonItem?.tintColor = .white
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
    }
    
    
    // MARK: -
    // MARK: Ovverided
    
    override func prepare() {
        self.presentLogin()
    }
}
