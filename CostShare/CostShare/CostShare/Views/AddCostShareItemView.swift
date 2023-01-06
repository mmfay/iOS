//
//  AddCostShareItemView.swift
//  CostShare
//
//  Created by Matthew Fay on 1/5/23.
//

import Foundation
import SwiftUI

struct AddCostShareItemView: View {
    @Environment (\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var newItemName = ""
    @State private var newItemCost: Double = 0.0
    @StateObject var costShareGroup: CostShareGroup
    var body: some View {
        Form {
            
            Group {
                
                TextField("Group Name", text: $newItemName)
                TextField("Cost Amount", value: $newItemCost, format: .currency(code: "USD"))
            

            }
            Section {
                
                Button("Submit") {
                    
                    DataController().addCostShareItem(group: costShareGroup, name: newItemName, amount: newItemCost, context: moc)
                    dismiss()
                    
                }
                Button("Dismiss") {
                    
                    dismiss()
                }
                .foregroundColor(.red)
            }
            
        }
    }
    
}

struct AddCostShareItemView_Previews: PreviewProvider {
    static let costShareGroup: CostShareGroup = costShareGroup
    static var previews: some View {
        AddCostShareItemView(costShareGroup: costShareGroup)
    }
}
