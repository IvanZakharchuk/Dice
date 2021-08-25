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
}

//

class CoreDataManager {
    
    // MARK: -
    // MARK: Properties
    
    private let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()

    public var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: -
    // MARK: Public
    
    public func getPlayer(player: NSManagedObjectID) -> CoreDataPlayer? {
        try? self.viewContext.existingObject(with: player) as? CoreDataPlayer
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
        persistentContainer = NSPersistentContainer(name: "TestAppModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
            
        }
    }
}



