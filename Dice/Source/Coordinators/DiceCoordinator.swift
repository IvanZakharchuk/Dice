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
    // хендлери прописати сюда від основних контрллерів
    
    private func presentLogin() {
        self.setupNavigation()
        let controller = LoginViewController(user: User())
        controller.eventHandler = { [weak self] event in
            self?.handle(event: event)
        }
        self.pushViewController(controller, animated: true)
    }
    
    private func handle(event: LoginViewControllerEvents) {
//        switch event {
//        case let .needDisplayGame:
//            <#code#>
//        }
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
