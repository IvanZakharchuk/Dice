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
    func read(player: CoreDataPlayer)
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

class CoreDataManager: CRUD {
 
    // MARK: -
    // MARK: Properties
    
    public let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()

    public var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: -
    // MARK: Public
    
    public func create(player: CoreDataPlayer) {
        // create
        
    }
    
    public func read(player: CoreDataPlayer) {
        //read data
    }
    
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
