//
//  LoginViewController.swift
//  Dice
//
//  Created by Іван Захарчук on 13.07.2021.
//

import UIKit

enum LoginViewControllerEvents {
    
    case needDisplayGame(User)
    // user name
}

class LoginViewController: BaseViewController, RootViewGetable {
    
    typealias RootView = LoginView

    // MARK: -
    // MARK: Properties
    
    public var eventHandler: ((LoginViewControllerEvents) -> ())?
    
    private var user: User
    
    // MARK: -
    // MARK: Initialization
    
    deinit {
        print("deinit LoginVC")
    }
    
    public init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Public
    
    public func presentGame(user: User) {
        self.eventHandler?(.needDisplayGame(user))
    }
    
    // MARK: -
    // MARK: Private
    
    private func handle(event: LoginViewEvents) {
        switch event {
        case let .shareUserName(user):
            self.user.userName = user
            self.presentGame(user: self.user)
            print(user) // model get name
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
