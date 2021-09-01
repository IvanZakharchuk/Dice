//
//  CoreDataService.swift
//  Dice
//
//  Created by Іван Захарчук on 25.08.2021.
//

import Foundation
import CoreData
import UIKit

protocol CRUD {
    
    func create()
    func read()
    func update()
    func delete(player: NSManagedObject)
}

class CoreDataManager: CRUD {
 
    // MARK: -
    // MARK: Properties
    
    public let persistentContainer: NSPersistentContainer

    public var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    static let shared = CoreDataManager()
    
    // MARK: -
    // MARK: Public
    
    public func create() {
        // create
        
        try? self.viewContext.save()
    }
    
    public func read() {
        try? viewContext.fetch(CoreDataPlayer.fetchRequest())

    }
    
    public func update() {
        self.create()
        self.read()
    }
    
    public func delete(player: NSManagedObject) {
        // delete
        self.viewContext.delete(player)
    }
    
    private func coreData() {
        
        guard let coreDataManager = UIApplication.shared.delegate as? CoreDataManager else { return }
        
        let managedContext = coreDataManager.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "CoreDataPlayer", in: managedContext) else { return }
    }
    // MARK: -
    // MARK: Initialization

    private init() {
        self.persistentContainer = NSPersistentContainer(name: "CoreData")
        self.persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
    }
}

//class CoreDataService: CRUD {
//
//    // MARK: - Core Data stack
//
//    lazy var persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "CoreData")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()
//
//    // MARK: - Core Data Saving support
//
//    func saveContext () {
//        let context = persistentContainer.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }
//
//    public func create(player: CoreDataPlayer) {
//        self.saveContext()
//    }
//
//    public func read(player: CoreDataPlayer) {
//
//    }
//
//    public func update(player: CoreDataPlayer) {
//
//    }
//
//    public func delete(player: CoreDataPlayer) {
//
//    }
//}
