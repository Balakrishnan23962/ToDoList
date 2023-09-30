//
//  UpdateToDoList.swift
//  ToDoList
//
//  Created by Logicfocus Techonology Solution on 30/09/23.
//

import SwiftUI

struct UpdateToDoList: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var model: DataModel
    var body: some View {
        NavigationStack {
            List {
                TextField("Name", text: $model.title)
                DatePicker("Choose a Date", selection: $model.time).datePickerStyle(.automatic)
                Toggle("Important", isOn: $model.isImportant)
                Button("Update") {
                    dismiss()
                }
            }
            .navigationTitle("Update ToDo")
        }
    }
}

