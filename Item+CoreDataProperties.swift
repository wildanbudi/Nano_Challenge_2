//
//  Item+CoreDataProperties.swift
//  
//
//  Created by Wildan Budi on 29/07/22.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var category: String?
    @NSManaged public var end: Date?
    @NSManaged public var name: String?
    @NSManaged public var start: Date?
    @NSManaged public var timestamp: Date?
    @NSManaged public var priority: String?
    @NSManaged public var completion: Bool

}
