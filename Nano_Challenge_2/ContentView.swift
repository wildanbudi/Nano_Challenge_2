//
//  ContentView.swift
//  Nano_Challenge_2
//
//  Created by Wildan Budi on 25/07/22.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        TabView {
            HomeView()
            .tabItem{
                Image(systemName: "1.square.fill")
                Text("Journey")
            }
            ListView()
            .tabItem{
                Image(systemName: "2.square.fill")
                Text("Task")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
