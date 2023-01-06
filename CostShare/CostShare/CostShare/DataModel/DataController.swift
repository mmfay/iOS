//
//  DataController.swift
//  CostShare
//
//  Created by Matthew Fay on 1/5/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    // container is just the model itself, where all the values are stored.
    let container = NSPersistentContainer(name: "CostShareModel")
    
    // initializer to load data into container.
    init() {
       
        // closure that gives us a description and an error.
        container.loadPersistentStores { desc, error in
            
            if let error = error {
                
                print("Failed to load the data \(error.localizedDescription)")
                
            }
            
        }
       
    }
    
    func save(context: NSManagedObjectContext) {
        
        do {
            
            try context.save()
            print("Data saved!!")
            
        } catch {
            
            print("We could not save the data...")
            
        }
        
    }

    func addGroup(name: String, person1: String, person2: String, context: NSManagedObjectContext) {
        
        let group = CostShareGroup(context: context)
        group.groupID = UUID()
        group.name = name
        group.person1 = person1
        group.person2 = person2
        
        save(context: context)
        
    }
    /*
    func editGroup(group: CostShareGroup, name: String, person1: String, person2: String, context: NSManagedObjectContext) {
        
        group.groupName = name
        group.person1 = person1
        group.person2 = person2
        
        save(context: context)
    
    }
    */
    
    func addCostShareItem(group: CostShareGroup, name: String, amount: Double, context: NSManagedObjectContext) {
        
        let costShare = CostShareItem(context: context)
        costShare.itemID = UUID()
        costShare.name = name
        costShare.amount = amount
        group.addToItem(costShare)
        save(context: context)
        
    }
    /*
    func editCostShare(costShare: CostShare, costAmount: Double, context: NSManagedObjectContext) {
        /*
        costShare.costAmount = costAmount
        
        save(context: context)
        */
    }
     */
    func editCostShareItem(costShareItem: CostShareItem, costAmount: Double, context: NSManagedObjectContext) {
        costShareItem.amount = costAmount
        
        save(context: context)
    }
}
