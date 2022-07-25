//
//  Nano_Challenge_2App.swift
//  Nano_Challenge_2
//
//  Created by Wildan Budi on 25/07/22.
//

import SwiftUI

@main
struct Nano_Challenge_2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
