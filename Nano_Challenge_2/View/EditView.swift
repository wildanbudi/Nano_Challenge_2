//
//  AddView.swift
//  Nano_Challenge_2
//
//  Created by Wildan Budi on 25/07/22.
//

import SwiftUI

struct EditView: View {
    @StateObject var Model : viewModel
//    @Binding var isModal: Bool
    
    var body: some View {
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
            Section {
                HStack {
                    Spacer()
                    Button("Mark as Done") {
                        print("Done")
                    }
                    .foregroundColor(Color.black)
                    Spacer()
                }
            }
            .padding(.all)
            .listRowInsets(EdgeInsets())
            .background(Color(red: 109/255, green: 175/255, blue: 215/255))
            Section {
                HStack {
                    Spacer()
                    Button("Delete") {
                        print("Delete")
                    }
                    .foregroundColor(Color(red: 25/255, green: 24/255, blue: 42/255))
                    Spacer()
                }
            }
            .padding(.all)
            .listRowInsets(EdgeInsets())
            .background(Color(red: 255/255, green: 110/255, blue: 110/255))
        }
        .navigationTitle("Edit")
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(Model: viewModel())
    }
}
