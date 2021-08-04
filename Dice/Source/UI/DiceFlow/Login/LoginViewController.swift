//
//  LoginViewController.swift
//  Dice
//
//  Created by Іван Захарчук on 13.07.2021.
//

import UIKit

enum LoginViewControllerEvents {

    case needDisplayGame(Player)
}

class LoginViewController: BaseViewController<LoginViewEvents>, RootViewGetable {
    
    typealias RootView = LoginView

    // MARK: -
    // MARK: Properties
    
    public var eventHandler: ((LoginViewControllerEvents) -> ())?
    
    private var user: Player
    
    // MARK: -
    // MARK: Initialization

    public init(user: Player) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Public
    
    public func presentGame(user: Player) {
        self.eventHandler?(.needDisplayGame(user))
    }
    
    // MARK: -
    // MARK: Overrided
    
    override func configureView() {
        super.configureView()
    }

    override func handle(event: LoginViewEvents) {
        super.handle(event: event)
        
        switch event {
        case let .shareUserName(name):
            self.user.name = name
            self.presentGame(user: self.user)
        }
    }
}
