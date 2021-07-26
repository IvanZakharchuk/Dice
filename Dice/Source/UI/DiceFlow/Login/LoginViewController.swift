//
//  LoginViewController.swift
//  Dice
//
//  Created by Іван Захарчук on 13.07.2021.
//

import UIKit

enum LoginViewControllerEvents {
    
    case needDisplayGame(User)
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
    
    
    // убрать в бейсонтрллер с дженерик типом где дженерик тип как ивент который
    // потом оверайднуть
    // дженерик тип как ивет откидывает хендлер
    private func handle(event: LoginViewEvents) {
        switch event {
        case let .shareUserName(name):
            self.user.name = name
            self.presentGame(user: self.user)
        }
    }
    
    // MARK: -
    // MARK: Overrided
    
    internal override func configureView() {
        super.configureView()
        // убрать в бейс контрлллер
        self.rootView?.setupView()
        self.rootView?.eventHandler = { [weak self] event in
            self?.handle(event: event)
        }
    }
}
