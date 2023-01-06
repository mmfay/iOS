//
//  CostShareItem+CoreDataProperties.swift
//  CostShare
//
//  Created by Matthew Fay on 1/5/23.
//
//

import Foundation
import CoreData


extension CostShareItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CostShareItem> {
        return NSFetchRequest<CostShareItem>(entityName: "CostShareItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var amount: Double
    @NSManaged public var itemID: UUID?
    @NSManaged public var group: CostShareGroup?
    
    public var unwrappedName: String {
        
        name ?? "Unknown Name"
        
    }
}

extension CostShareItem : Identifiable {

}
