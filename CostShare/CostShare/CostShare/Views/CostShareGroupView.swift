//
//  CostShareGroupView.swift
//  CostShare
//
//  Created by Matthew Fay on 1/6/23.
//

import SwiftUI

struct CostShareGroupView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var costShareGroup: FetchedResults<CostShareGroup>
    @State private var showingAddView = false
    
    // Gets default currency from user phone, if not available USD is used.
    var currency: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(costShareGroup) { group in
                        Group {
                            NavigationLink {
                                CostShareItemView(costShareGroup: group)
                            } label: {
                                VStack {
                                    Text(group.name!)
                                    
                                    HStack {
                                        
                                        Text(group.person1!)
                                        Text(group.person2!)
                                        Text(getSumOfItems(costShareGroup: group), format: currency)
                                        
                                    }
                                }
                            }
                        }
                        
                    }
                    .onDelete(perform: deleteGroup)
                    
                }

            }
            .navigationTitle("CostShare Groups")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button {
                        
                        
                    } label: {
                        
                        Label("Edit", systemImage: "square.and.pencil.circle.fill")
                            .foregroundColor(.red)
                    }
                    
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button {
                        
                        showingAddView.toggle()
                        
                    } label: {
                        
                        Label("Add Food", systemImage: "plus.app.fill")
                        
                    }
               
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button {
                        
                        
                    } label: {
                        
                        Label("Info", systemImage: "info.circle")
                    }
                    
                }
                

            }
            .sheet(isPresented: $showingAddView) {
                AddCostShareGroupView()
            }
            .onAppear {
                self.moc.refreshAllObjects()
            }
            
        }
    }
    
    private func deleteGroup(offsets: IndexSet) {

        offsets.map { costShareGroup[$0] }.forEach(moc.delete)
            DataController().save(context: moc)

    }
    
    private func getSumOfItems(costShareGroup: CostShareGroup) -> Double {
        
        var sumCost: Double = 0.0
        
        for item in costShareGroup.costSharesArray {
            
            sumCost += item.amount
            
        }
        return sumCost
        
    }
}
