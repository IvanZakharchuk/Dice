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
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
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
        case let .needDisplayGame(user):
            self.presentGame(user: user)
        }
    }
    
    private func presentGame(user: String) {
        self.setupNavigation()
        let controller = GameViewController()
        controller.eventHandler = { [weak self] event in
            self?.handle(event: event)
        }
        controller.rootView?.scoreViewUpdate(user: user)
        controller.modalPresentationStyle = .overFullScreen
        self.present(controller, animated: true, completion: nil)
    }
    
    private func handle(event: GameViewControllerEvents) {
        switch event {
        case let .needDisplayLeaderboard:
            self.presentLeaderBoard()
        }
    }
    
    private func presentLeaderBoard() {
        
    }
    
    
    private func setupNavigation() {
        navigationItem.hidesBackButton = true
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
    }
    
    
    // MARK: -
    // MARK: Ovverided
    
    override func prepare() {
        self.presentLogin()
    }
}
