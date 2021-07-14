//
//  LoginViewController.swift
//  Dice
//
//  Created by Іван Захарчук on 13.07.2021.
//

import UIKit

enum LoginViewControllerEvents {
    
    case needDisplayGame
    // user name 
}

class LoginViewController: UIViewController, RootViewGetable {
    
    typealias RootView = LoginView

    // MARK: -
    // MARK: Properties
    
    public var eventHandler: ((LoginViewControllerEvents) -> ())?
    
    // MARK: -
    // MARK: Private
    
    private func configureLoginView() {
        self.rootView?.eventHandler = { [weak self] event in
            self?.handle(event: event)
        }
    }
    
    private func handle(event: LoginViewEvents) {
//        switch event {
//        case let .enterButtonPressed:
//            self.
//            // func to export string from view to controller
//        }
    }
    
    // MARK: -
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureLoginView()
    }
}
