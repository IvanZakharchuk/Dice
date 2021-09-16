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
    func read(name: String) -> Player?
    func read() -> [Player]
    func update(player: Player)
    func delete(player: Player)
}

class CoreDataManager: CRUD {
 
    // MARK: -
    // MARK: Properties
    
    private var viewContext: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    private let persistentContainer: NSPersistentContainer
    
    // MARK: -
    // MARK: Public
    
    public func create(player: Player) {
        let coreDataPlayer = CoreDataPlayer(context: self.viewContext)
        coreDataPlayer.nameValue = player.name
        coreDataPlayer.scoreValue = Int16(player.score)
        self.save()
    }

    public func read(name: String) -> Player? {
        let players = self.fetchCoreData(name: name)
        return players.map { Player(name: $0.nameValue ?? "User", score: Int($0.scoreValue)) }.first
    }
    
    public func read() -> [Player] {
        return self.fetchData().map { Player(name: $0.nameValue ?? "User", score: Int($0.scoreValue))}
    }
    
    public func update(player: Player) {
        let userCoreData = self.fetchCoreData(name: player.name).first ?? CoreDataPlayer(context: self.viewContext)
        userCoreData.scoreValue = Int16(player.score)
        userCoreData.nameValue = player.name
        
        self.save()
    }
    
    public func delete(player: Player) {
        let userToDelete = self.fetchCoreData(name: player.name).first
        userToDelete.map(self.viewContext.delete)

        self.save()
    }
    
    // MARK: -
    // MARK: Private
    
    private func save() {
        try? self.viewContext.save()
    }
    
    private func fetchCoreData(name: String) -> [CoreDataPlayer] {
        let request: NSFetchRequest<CoreDataPlayer> = CoreDataPlayer.fetchRequest()
        request.predicate = NSPredicate(format: "nameValue == '\(name)'")
    
        do {
            return try self.viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    private func fetchData() -> [CoreDataPlayer] {
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
