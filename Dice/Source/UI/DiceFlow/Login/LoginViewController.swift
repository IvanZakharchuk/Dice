//
//  LoginViewController.swift
//  Dice
//
//  Created by Іван Захарчук on 13.07.2021.
//

import UIKit
import CoreData

enum LoginViewControllerEvents {

    case needDisplayGame(Player)
}

class LoginViewController: BaseViewController<LoginViewEvents, LoginViewControllerEvents>, RootViewGetable {
    
    typealias RootView = LoginView

    // MARK: -
    // MARK: Properties
        
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
    
    private func saveToCoreData(name: String) {
        let player = self.coreData?[]
        let newPlayer = DiceStorage(context: self.context!)
        newPlayer.name = name
        print(newPlayer.name)
        do {
            try self.context?.save()
        }
        catch {
            
        }
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
//            self.user.name = name
            self.saveToCoreData(name: name)
            self.presentGame(user: self.user)
        }
    }
    
    
}
