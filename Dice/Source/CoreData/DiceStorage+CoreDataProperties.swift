//
//  DiceStorage+CoreDataProperties.swift
//  Dice
//
//  Created by Іван Захарчук on 16.08.2021.
//
//

import Foundation
import CoreData

extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "DiceStorage")
    }

    @NSManaged public var name: String?
    @NSManaged public var score: Int16
    
}

extension Player : Identifiable {

}
