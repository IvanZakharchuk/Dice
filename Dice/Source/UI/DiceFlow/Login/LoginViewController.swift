//
//  LoginViewController.swift
//  Dice
//
//  Created by Іван Захарчук on 13.07.2021.
//

import UIKit
import CoreData

enum LoginViewControllerEvents {
    case needDisplayGame(Player, CRUD)
}

class LoginViewController: BaseViewController<LoginView, LoginViewEvents, LoginViewControllerEvents>, RootViewGetable {
    
    typealias RootView = LoginView

    // MARK: -
    // MARK: Properties
        
    private let context: CRUD
    
    // MARK: -
    // MARK: Initialization

    public init(context: CRUD) {
        self.context = context
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Public
    
    public func presentGame(user: Player) {
        self.eventHandler?(.needDisplayGame(user, self.context))
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
            let player = self.context.read(name: name) ?? Player(name: name, score: 0)
            
            self.context.create(player: player)
            self.presentGame(user: player)
        }
    }
}
