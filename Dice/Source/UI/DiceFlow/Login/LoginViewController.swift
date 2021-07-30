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

class LoginViewController: BaseViewController, RootViewGetable, Events {
    
    typealias Events = LoginViewEvents
    
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
    // MARK: Private
    
    // убрать в бейсонтрллер с дженерик типом где дженерик тип как ивент который
    // потом оверайднуть
    // дженерик тип как ивет откидывает хендлер
    
//    override func handle(event: Events) {
//        <#code#>
//    }
    
    private func handle(event: Events) {
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
        // убрать в бейс контрлллер(часть есть)
//        self.rootView?.setupView()
        self.rootView?.eventHandler = { [weak self] event in
            self?.handle(event: event)
        }
    }
}
