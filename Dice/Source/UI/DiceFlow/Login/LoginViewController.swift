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
    private var playerStorage: [PlayerModel] = []
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
    
    private func saveToCoreData(name: String) {
//        let newPlayer = CoreDataPlayer(context: CoreDataManager.shared.persistentContainer.viewContext)
//        let newPlayer = CoreDataPlayer(context: CoreDataManager.shared.viewContext)
//        newPlayer.name = name
//        print(newPlayer.name)
    
//        self.context.saveContext()
//        CoreDataManager.shared.saveContext()
        
//        let player: CoreDataPlayer = self.playerStorage.first?.player
        
//        let newPLayer = self.playerStorage.map { $0.player }
        
        let newPlayer = self.playerStorage.first
//        let newPlayer = self.playerStorage.map { self.playerStorage.}
        newPlayer?.player.name = name
        print(newPlayer?.name)
        self.context.create(player: newPlayer?.player ?? CoreDataPlayer())
        
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
            self.saveToCoreData(name: name)
            self.presentGame(user: self.user)
        }
    }
}
