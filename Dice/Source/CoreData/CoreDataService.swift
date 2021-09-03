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
    
    func create(player: Player)
    //func read() -> Player
    func read() -> [Player]
    func update(player: Player)
    func delete(player: Player)
}

class CoreDataManager: CRUD {
 
    // MARK: -
    // MARK: Properties
    
    public let persistentContainer: NSPersistentContainer

    public var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: -
    // MARK: Public
    
    public func create(player: Player) {
        CoreDataPlayer().name = player.name
        self.save()
    }
    
//    public func read() -> Player {
//        let coreDataPlayer = self.fetchCoreData().first
//
//
//    }
    
    public func read() -> [Player] {
        let request: NSFetchRequest<CoreDataPlayer> = CoreDataPlayer.fetchRequest()
        
        do {
            return try self.corePlayers().map { Player(name: $0.name, score: $0.score) }
        } catch {
            return []
        }
    }
    
    private func corePlayers() -> [CoreDataPlayer] {
        let request: NSFetchRequest<CoreDataPlayer> = CoreDataPlayer.fetchRequest()
        // request.predicate Zadatb predicate
        
        return self.viewContext.fetch(request)
    }
    
    public func update(player: Player) {
        guard let userCoreData = self.corePlayers().first { $0.name == player.name } else {
            return self.create(player: player)
        }
        userCoreData.score = Int16(player.score)
        self.save()
    }
    
    public func delete(player: Player) {
        guard let userCoreData = self.read().first(where: {$0.name == player.name})  else {
            return self.create(player: player)
        }
        self.viewContext.delete(userCoreData)
        self.save()
    }
    
    // MARK: -
    // MARK: Private
    
    private func save() {
        try? self.viewContext.save()
    }
    
    private func fetchCoreData() -> [CoreDataPlayer] {
        let request: NSFetchRequest<CoreDataPlayer> = CoreDataPlayer.fetchRequest()
        
        do {
            return try self.viewContext.fetch(request)
        } catch {
            return []
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
