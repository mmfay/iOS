//
//  CostShareItemView.swift
//  CostShare
//
//  Created by Matthew Fay on 1/5/23.
//

import SwiftUI

struct CostShareItemView: View {
    
    @StateObject var costShareGroup: CostShareGroup
    @State private var showingAddView = false
    var body: some View {
         
        VStack(alignment: .leading) {
            List {
                ForEach(costShareGroup.costSharesArray) { costShareItem in
                    
                    Section {
                        CostShareFilteredView(costShareItem: costShareItem)
                    }

                }
            }
        }
        .navigationTitle("CostShare Items")
        .toolbar {
            
            ToolbarItem(placement: .navigationBarTrailing) {
                
                Button {
                    
                    showingAddView.toggle()
                    
                } label: {
                    
                    Label("Add Food", systemImage: "plus.app.fill")
                    
                }
                
            }
        }
        .sheet(isPresented: $showingAddView) {
            AddCostShareItemView(costShareGroup: costShareGroup)
        }
        
    }
}


