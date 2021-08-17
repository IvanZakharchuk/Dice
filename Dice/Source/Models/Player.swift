//
//  Dice.swift
//  Dice
//
//  Created by Іван Захарчук on 13.07.2021.
//

import Foundation
import CoreData
import UIKit

class Player {
    
    // MARK: -
    // MARK: Properties

    public var name = ""
    public var currentPosition = 0
    public let emptyPosition = 0
    
    public var score = 0
    
    public var dice: Dices
    
//    public var userStorage: [DiceStorage] = []
    
//    private var fetchResult: NSFetchedResultsController<DiceStorage>?
    
    // MARK: -
    // MARK: Initialization
    
    public init(dice: Dices) {
        self.dice = dice
    }
    
    // MARK: -
    // MARK: Private
    
    public func shuffleDice() {
        self.currentPosition = self.dice.random()
    }
    
//    private func coreDataFunc() {
//        let fetchRequest: NSFetchRequest<DiceStorage> = DiceStorage.fetchRequest()
//
//        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
//            let context = appDelegate.persistentContainer.viewContext
//            fetchResult = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
//
//            do {
//                try fetchResult?.performFetch()
//                if let fetchedObjects = fetchResult?.fetchedObjects {
//                    userStorage = fetchedObjects
//                }
//            } catch {
//                print(error)
//            }
//        }
//
//    }
}
