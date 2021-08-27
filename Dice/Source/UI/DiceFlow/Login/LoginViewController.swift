//
//  LoginViewController.swift
//  Dice
//
//  Created by Іван Захарчук on 13.07.2021.
//

import UIKit
import CoreData

//protocol Storable {
//
//    func save()
//    func load()
//}
//
//class Controller {
//
//    let storage: Storable
//
//    init(storage: Storable) {
//        self.storage = storage
//    }
//
////    func viewDidApear() {
////        self.storage.save()
////    }
//}
//
//class DataCoreStorablee: Storable {
//
//    func save() {
////        SharedInstance.save()
//    }
//}
//// дата кор не нада
//
//class CoreDataStorable: Storable {
//
//    let context: NSManagedObjectContext
//
//    init(context: NSManagedObjectContext) {
//        self.context = context
//    }
//
//    func save() {
//        try? self.context.save()
//    }
//}
//
//class Coordinator {
//
//    func viewDidApear() {
//        let controller = Controller(storage: CoreDataStorable(context: NSManagedObjectContext.init()))
//    }
//}
//
enum LoginViewControllerEvents {

    case needDisplayGame(Player, Fetchable & Storable)
}

class LoginViewController: BaseViewController<LoginViewEvents, LoginViewControllerEvents>, RootViewGetable {
    
    
    
    typealias RootView = LoginView

    // MARK: -
    // MARK: Properties
        
    private var user: Player
//    private var playerStorage: [CoreDataPlayer]?
    
//    public let context = (UIApplication.shared.delegate as? CoreDataService)?.persistentContainer.viewContext
    
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
//        let player = self.coreData?[IndexPath]
//        let newPlayer = self.context.map(CoreDataPlayer.init)
        
        let newPlayer = CoreDataPlayer(context: CoreDataManager.shared.persistentContainer.viewContext)
        
//        let newPlayer = self.context.persistentContainer.viewContext
        
        newPlayer.name = name
        print(newPlayer.name)

        self.context.saveContext()
        CoreDataManager.shared.savePlayer()
        
//        do {
//            try self.context.saveContext()
//        }
//        catch {
//
//        }
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
