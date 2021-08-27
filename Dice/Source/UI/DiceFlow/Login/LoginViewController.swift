//
//  LoginViewController.swift
//  Dice
//
//  Created by Іван Захарчук on 13.07.2021.
//

import UIKit
import CoreData

enum LoginViewControllerEvents {

    case needDisplayGame(Player, Fetchable & Storable)
}

class LoginViewController: BaseViewController<LoginViewEvents, LoginViewControllerEvents>, RootViewGetable {
    
    typealias RootView = LoginView

    // MARK: -
    // MARK: Properties
        
    private var user: Player
    private var playerStorage: [PlayerModel] = []
    private let context: Fetchable & Storable
    
    // MARK: -
    // MARK: Initialization

    public init(user: Player, context: Fetchable & Storable) {
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
//        let newPlayer = self.playerStorage[0].player
        let newPlayer = self.playerStorage.map { $0.player }
        newPlayer.map { $0.name = name }
//        newPlayer.name = name
//        print(newPlayer.name)
        
        self.context.saveContext(player: newPlayer)
//        CoreDataManager.shared.saveContext()
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
