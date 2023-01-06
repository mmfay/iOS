//
//  CostShareFilteredView.swift
//  CostShare
//
//  Created by Matthew Fay on 1/5/23.
//

import SwiftUI

struct CostShareFilteredView: View {
    @Environment(\.managedObjectContext) var moc
    @StateObject var costShareItem: CostShareItem
    @State var localCost: Double = 0.0
    
    // Gets default currency from user phone, if not available USD is used.
    var currency: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
    var body: some View {
        
        VStack {
            HStack {
                Text(costShareItem.unwrappedName)
                Text(costShareItem.amount, format: currency)
            }
            Slider(value: $localCost, in: 1...100, step: 1) { editing in
                if (!editing) {
                    DataController().editCostShareItem(costShareItem: costShareItem, costAmount: localCost, context: moc)
                }
            }
            .onAppear {
                localCost = costShareItem.amount
            }
            
        }
    }
}


