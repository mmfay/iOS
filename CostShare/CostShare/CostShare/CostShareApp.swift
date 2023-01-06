//
//  CostShareApp.swift
//  CostShare
//
//  Created by Matthew Fay on 1/5/23.
//

import SwiftUI

@main
struct CostShareApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
