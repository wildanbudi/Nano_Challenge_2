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
            HomeView(dataModel: NotionViewModel())
            .tabItem{
                Image(systemName: "book.closed.fill")
                Text("Journey")
            }
            ListView(dataModel: NotionViewModel())
            .tabItem{
                Image(systemName: "list.bullet")
                Text("Activity")
            }
        }
        .onAppear(perform: NotionViewModel().getData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
