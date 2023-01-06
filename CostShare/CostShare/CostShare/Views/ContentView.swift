//
//  ContentView.swift
//  CostShare
//
//  Created by Matthew Fay on 1/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var costShareGroup: FetchedResults<CostShareGroup>
    @State private var showingAddView = false
    
    // Gets default currency from user phone, if not available USD is used.
    var currency: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
    
    var body: some View {
        CostShareGroupView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
