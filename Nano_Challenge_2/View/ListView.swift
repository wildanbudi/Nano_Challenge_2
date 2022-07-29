//
//  ListView.swift
//  Nano_Challenge_2
//
//  Created by Wildan Budi on 25/07/22.
//

import SwiftUI

struct ListView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    @State var status = true
    @State var isModal: Bool = false
    @StateObject var dataModel: NotionViewModel
    
    var body: some View {
        NavigationView {
            Form {
                NavigationLink(destination: EditView(Model: viewModel())) {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Design")
                            Text("Task 1")
                            HStack {
                                Text("Date")
                                Spacer()
                                Text("HIgh")
                            }
                        }
                }
                .padding(.all)
                .listRowInsets(EdgeInsets())
                .background(Image("Design-BG").resizable().scaledToFill())
            }
            .navigationTitle("Learning List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.isModal = true
                    }) {
                        Label("Add", systemImage:"plus")
                    }.sheet(isPresented: $isModal, content: {
                        AddView(Model: viewModel(), isModal: $isModal)
                    })
                }
            }
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(dataModel: NotionViewModel())
    }
}
