//
//  AddView.swift
//  Nano_Challenge_2
//
//  Created by Wildan Budi on 25/07/22.
//

import SwiftUI
class viewModel: ObservableObject {
    enum Category: String, CaseIterable, Identifiable {
        case design, tech, pro, none
        var id: Self { self }
    }
    enum Priority: String, CaseIterable, Identifiable {
        case high, medium, low
        var id: Self { self }
    }

    @Published var name = ""
    @Published var selectedCategory: Category = .none
    @Published var selectedPriority: Priority = .low
}

struct AddView: View {
    @StateObject var Model : viewModel
    @Binding var isModal: Bool
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("Insert Activity Name", text: $Model.name)
                } header: {
                    Text("Activity Name")
                }
                Section {
                    Picker("Category", selection: $Model.selectedCategory) {
                        Text("Tech").tag(viewModel.Category.tech)
                        Text("Design").tag(viewModel.Category.design)
                        Text("Pro Skill").tag(viewModel.Category.pro)
                        }
                } header: {
                    Text("Category")
                }
                Section {
                    Picker("Priority", selection: $Model.selectedPriority
                    ) {
                        Text("High").tag(viewModel.Priority.high)
                        Text("Medium").tag(viewModel.Priority.medium)
                        Text("Low").tag(viewModel.Priority.low)
                        }
                } header: {
                    Text("Priority")
                }
                Section{
                    DatePicker(
                        selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/,
                        displayedComponents: [.date],
                        label: { Text("Start Date") })
                    DatePicker(
                            "End Date",
                             selection: .constant(Date()),
//                             in: dateRange,
                             displayedComponents: [.date]
                        )
                } header: {
                    Text("Learning Time")
                }
            }
            .navigationTitle("Add Learning Goal")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        self.isModal = false
                    }
                }
            }
        }
    }
}
