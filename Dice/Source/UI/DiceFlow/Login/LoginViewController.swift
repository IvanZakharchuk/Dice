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

class LoginViewController: BaseViewController<LoginViewEvents, LoginViewControllerEvents>, RootViewGetable {
    
    typealias RootView = LoginView

    // MARK: -
    // MARK: Properties
        
    private var user: Player
    private var coreDataPlayer:CoreDataPlayer?
    private let context: CRUD
    
    // MARK: -
    // MARK: Initialization

    public init(user: Player, context: CRUD) {
        self.user = user
        self.context = context
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Public
    
    public func presentGame(user: Player) {
        self.eventHandler?(.needDisplayGame(user, context))
    }
    
    // MARK: -
    // MARK: Private
    
    private func saveToCoreData(user: Player) {
        self.context.create(player: self.user)
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
            self.saveToCoreData(user: self.user)
            self.presentGame(user: self.user)
        }
    }
}
