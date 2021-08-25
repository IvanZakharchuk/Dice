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
}

class CoreDataManager {
    
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
        do {
            return try self.viewContext.fetch(request)
        } catch  {
            return []
        }
    }
    
    
    func getPlayerkById(id: NSManagedObjectID) -> CoreDataPlayer? {
        do {
            return try viewContext.existingObject(with: id) as? CoreDataPlayer
        } catch {
            return nil
        }
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

    private init() {
        persistentContainer = NSPersistentContainer(name: "CoreData")
        persistentContainer.loadPersistentStores { (description, error) in
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

protocol FetchData {

    func fetch()
    func delete()
}

class FetchDataClass {

    let storage: FetchData

    init(storage: FetchData) {
        self.storage = storage
    }
    
    func delete() {
        self.storage.delete()
    }

    func fetchData() {
        self.storage.fetch()
    }
}

class StorableClass {
    
    let storage: Storable
    
    init(storage: Storable) {
        self.storage = storage
    }
}

class TestVC: FetchData {
    func fetch() {
        
    }
    
    func delete() {
        
    }
    
    
}




