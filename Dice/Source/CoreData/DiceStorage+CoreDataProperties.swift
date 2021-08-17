//
//  DiceStorage+CoreDataProperties.swift
//  Dice
//
//  Created by Іван Захарчук on 16.08.2021.
//
//

import Foundation
import CoreData


extension DiceStorage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DiceStorage> {
        return NSFetchRequest<DiceStorage>(entityName: "DiceStorage")
    }

    @NSManaged public var name: String?
    @NSManaged public var scoreUser: Int16
    @NSManaged public var scoreBot: Int16
    
}

extension DiceStorage : Identifiable {

}
