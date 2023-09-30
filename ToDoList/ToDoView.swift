//
//  ToDoView.swift
//  ToDoList
//
//  Created by Logicfocus Techonology Solution on 29/09/23.
//

import SwiftUI

struct ToDoView: View {
    @Environment(\.dismiss) var dismiss
    @State var model = DataModel()
    @Environment(\.modelContext) var modelContext
    var body: some View {
        List {
            TextField("Name", text: $model.title)
            DatePicker("Choose a Date", selection: $model.time).datePickerStyle(.automatic)
            Toggle("Important", isOn: $model.isImportant)
            Button("Create") {
                withAnimation {
                    modelContext.insert(model)
                }
                dismiss()
            }
        }
        .navigationTitle("Create ToDo")
    }
}

#Preview {
    ToDoView()
        .modelContainer(for: DataModel.self)
}
