//
//  AddCostShareGroupView.swift
//  CostShare
//
//  Created by Matthew Fay on 1/5/23.
//

import SwiftUI

struct AddCostShareGroupView: View {
    @Environment (\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var newGroupName = ""
    @State private var newGroupPerson1 = ""
    @State private var newGroupPerson2 = ""
    var body: some View {
        Form {
            
            Section {
                
                TextField("Group Name", text: $newGroupName)
                TextField("Person 1 Name", text: $newGroupPerson1)
                TextField("Person 2 Name", text: $newGroupPerson2)

            }
            Section {
                
                Button("Submit") {
                    
                    DataController().addGroup(name: newGroupName, person1: newGroupPerson1, person2: newGroupPerson2, context: moc)
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

struct AddCostShareGroupView_Previews: PreviewProvider {
    static var previews: some View {
        AddCostShareGroupView()
    }
}
