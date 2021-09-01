//
//  CoreDataService.swift
//  Dice
//
//  Created by Іван Захарчук on 25.08.2021.
//

import Foundation
import CoreData

protocol CRUD {
    
    func create(player: CoreDataPlayer)
//    func read() -> CoreDataPlayer
    func update(player: CoreDataPlayer)
    func delete(player: CoreDataPlayer)
}

//protocol Storable {
//
//    func saveContext()
//}
//
//protocol Fetchable {
//
//    func fetch()  -> [CoreDataPlayer]
//    func delete(player: CoreDataPlayer)
//}
//
struct PlayerModel {

    public let player: CoreDataPlayer
    public var id: NSManagedObjectID {
        return player.objectID
    }

    public var name: String {
        return player.name ?? ""
    }

    public var score: Int {
        return Int(player.score)
    }
}

//
//extension CoreDataPlayer {
//
//}


class CoreDataManager: CRUD {
 
    // MARK: -
    // MARK: Properties
    
    
    
//    private let entity = NSEntityDescription.entity(forEntityName: "CoreDataPlayer", in: mana)
    
    public let persistentContainer: NSPersistentContainer

    public var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: -
    // MARK: Public
    
    public func create(player: CoreDataPlayer) {
        // create
        
        try? self.viewContext.save()
    }
    
//    public func read() -> CoreDataPlayer {
//        let request: NSFetchRequest<CoreDataPlayer> = CoreDataPlayer.fetchRequest()
        let request: NSFetchRequest<CoreDataPlayer> = CoreDataPlayer.fetchRequest()
//        return
//        return (try? self.viewContext.fetch(request)) ?? []
//    }
    
    public func update(player: CoreDataPlayer) {
        // updarte
    }
    
    public func delete(player: CoreDataPlayer) {
        // delete
    }
    
//    public func fetch() -> [CoreDataPlayer] {
//        let request: NSFetchRequest<CoreDataPlayer> = CoreDataPlayer.fetchRequest()
//
//        return (try? self.viewContext.fetch(request)) ?? []
//    }
//
//    public func delete(player: CoreDataPlayer) {
//        self.viewContext.delete(player)
//        self.saveContext()
//    }
//
//    public func saveContext() {
//        try? self.viewContext.save()
//    }
    
    
    private func saveContext() {
        let context = self.viewContext
        
        if context.hasChanges {
            try? self.viewContext.save()
        }
    }
    // MARK: -
    // MARK: Initialization

    public init() {
        self.persistentContainer = NSPersistentContainer(name: "CoreData")
        self.persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
            
        }
    }
}

class CoreDataService: CRUD {
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    public func create(player: CoreDataPlayer) {
        self.saveContext()
    }
    
    public func read(player: CoreDataPlayer) {
        
    }
    
    public func update(player: CoreDataPlayer) {
        
    }
    
    public func delete(player: CoreDataPlayer) {
        
    }
}
