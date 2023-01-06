//
//  CostShareGroup+CoreDataProperties.swift
//  CostShare
//
//  Created by Matthew Fay on 1/5/23.
//
//

import Foundation
import CoreData


extension CostShareGroup {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CostShareGroup> {
        return NSFetchRequest<CostShareGroup>(entityName: "CostShareGroup")
    }

    @NSManaged public var person1: String?
    @NSManaged public var person2: String?
    @NSManaged public var name: String?
    @NSManaged public var groupID: UUID?
    @NSManaged public var item: NSSet?
    
    public var unwrappedName: String {
        
        name ?? "Unknown Name"
        
    }
    public var unwrappedPersonOne: String {
        
        person1 ?? "Unknown Name"
        
    }
    public var unwrappedPersonTwo: String {
        
        person2 ?? "Unknown Name"
        
    }
    public var costSharesArray: [CostShareItem] {
        
        let costShareItemSet = item as? Set<CostShareItem> ?? []
        
        return costShareItemSet.sorted {
            
            $0.unwrappedName < $1.unwrappedName
            
        }
        
    }
}

// MARK: Generated accessors for item
extension CostShareGroup {

    @objc(addItemObject:)
    @NSManaged public func addToItem(_ value: CostShareItem)

    @objc(removeItemObject:)
    @NSManaged public func removeFromItem(_ value: CostShareItem)

    @objc(addItem:)
    @NSManaged public func addToItem(_ values: NSSet)

    @objc(removeItem:)
    @NSManaged public func removeFromItem(_ values: NSSet)

}

extension CostShareGroup : Identifiable {

}
