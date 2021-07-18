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
    
    private var user: User
    
    // MARK: -
    // MARK: Initialization
    
    deinit {
        print("deinit")
    }
    
    public init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureLoginView()
    }
    
    // MARK: -
    // MARK: Public
    
    public func presentGame() {
        self.eventHandler?(.needDisplayGame)
    }
    
    // MARK: -
    // MARK: Private
    
    private func configureLoginView() {
        self.rootView?.setupView()
        self.rootView?.eventHandler = { [weak self] event in
            self?.handle(event: event)
        }
    }
    
    private func handle(event: LoginViewEvents) {
        switch event {
        case let .shareUserName(user):
            self.user.userName = user
            print(user) // model get name
        case .startGame:
            self.presentGame()
        }
    }
}
