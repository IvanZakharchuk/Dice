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
    @NSManaged public var score: Int16

}

extension DiceStorage : Identifiable {

}
