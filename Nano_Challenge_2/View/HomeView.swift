//
//  HomeView.swift
//  Nano_Challenge_2
//
//  Created by Wildan Budi on 27/07/22.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    @StateObject var dataModel: NotionViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    List {
                        VStack {
                            HStack {
                                Text("Tech")
                                Spacer()
                                Text("1/1")
                            }
                            ProgressView(value: 1)
                                .progressViewStyle(LinearProgressViewStyle(tint: Color(UIColor(red: 48/255, green: 153/255, blue: 238/255, alpha: 255/255))))
                        }
                        VStack {
                            HStack {
                                Text("Design")
                                Spacer()
                                Text("0/1")
                            }
                            ProgressView(value: 0)
                                .progressViewStyle(LinearProgressViewStyle(tint: Color(UIColor(red: 255/255, green: 0/255, blue: 162/255, alpha: 255/255))))
                        }
                        VStack {
                            HStack {
                                Text("Pro Skill")
                                Spacer()
                                Text("0/0")
                            }
                            ProgressView(value: 0)
                                .progressViewStyle(LinearProgressViewStyle(tint: Color(UIColor(red: 112/255, green: 223/255, blue: 165/255, alpha: 255/255))))
                        }
                    }
                } header: {
                    Text("Achievement")
                }
                Section {
                    List {
                        HStack {
                            Text("Task 1")
                            Spacer()
                            Text("Design")
                        }
                    }
                } header: {
                    Text("Today's Learning")
                }
//                Section {
//                    List {
//                        ForEach(items) { item in
//                            NavigationLink {
//                                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                            } label: {
//                                Text(item.timestamp!, formatter: itemFormatter)
//                            }
//                        }
//                        .onDelete(perform: deleteItems)
//                    }
//                }
            }
            .navigationTitle("My Journey")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button("Add") {
//                        dataModel.getData()
////                        print($dataModel.data)
//                    }
//                }
//            }
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

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

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

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(dataModel: NotionViewModel())
    
    }
}
