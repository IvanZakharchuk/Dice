//
//  CoreDataService.swift
//  Dice
//
//  Created by Іван Захарчук on 25.08.2021.
//

import Foundation
import CoreData

class CoreDataService {
    
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

    func saveContext() {
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
}
//////////////
//////
/////

// My Variant

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

class CoreDataManager: Storable, Fetchable {
    
    func delete(player: CoreDataPlayer) {
        self.viewContext.delete(player)
        self.savePlayer()
    }
    
    func saveContext() {
        try? self.viewContext.save()
    }
    
    
    
    // MARK: -
    // MARK: Properties
    
    public let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()

    public var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: -
    // MARK: Public
    
    public func getPlayer() -> [CoreDataPlayer] {
        let request: NSFetchRequest<CoreDataPlayer> = CoreDataPlayer.fetchRequest()
        
        return (try? self.viewContext.fetch(request)) ?? []
    }
    
    
    public func getPlayerkById(id: NSManagedObjectID) -> CoreDataPlayer? {
        return try? viewContext.existingObject(with: id) as? CoreDataPlayer
    }
    
    public func deletePlayer(player: CoreDataPlayer) {
        self.viewContext.delete(player)
        self.savePlayer()
    }
    
    public func savePlayer() {
        try? self.viewContext.save()
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


// Second Variant

protocol Storable {

    func saveContext()
}

protocol Fetchable {

//    func fetch(id: Int)
    func delete(player: CoreDataPlayer)
}

class FetchDataClass {

   
}

class StorableClass {
    
    let storage: Storable
    
    init(storage: Storable) {
        self.storage = storage
    }
}

//class TestVC {
//
//    let storage: Fetchable & Storable
//    let id: Int
//
//    private var user: User?
//
//    init(storage: Fetchable & Storable, id: Int) {
//        self.storage = storage
//        self.id = id
//    }
//
//    func loadButtonTapped() {
//        self.user = self.storage.fetch(id: self.id)
//        self.user.name = "Vasya"
//    }
//
//    func saveButtonTapped() {
//        self.storage.saveContext()
//    }
//}
