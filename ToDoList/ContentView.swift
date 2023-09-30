//
//  ContentView.swift
//  ToDoList
//
//  Created by Logicfocus Techonology Solution on 29/09/23.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    @State var isShow = false
    @Query(
        sort: \DataModel.time
    ) private var items: [DataModel]
    @State var updateModel: DataModel?
    @Environment(\.modelContext) var context
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    DataListView(item: item)
                        .onTapGesture {
                            updateModel = item
                        }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        context.delete(items[index])
                    }
                }
            }
            .toolbar {
                if !items.isEmpty {
                    ToolbarItem {
                        Button(action: {
                            isShow.toggle()
                        }, label: {
                            Image(systemName: "plus")
                        })
                    }

                }
            }
            .navigationTitle("ToDo List")
        }
        .sheet(isPresented: $isShow, content: {
            NavigationStack {
                ToDoView()
            }
            .presentationDetents([.medium])
        })
        .sheet(item: $updateModel) { model in
            UpdateToDoList(model: model)
                .presentationDetents([.medium])
        }
        .overlay {
            if items.isEmpty {
                ContentUnavailableView(label: {
                    Label("No Data", systemImage: "list.bullet.rectangle.portrait")
                }, description: {
                    Text("Maintain your Daily ToDo List")
                }, actions: {
                    Button(action: {
                        isShow.toggle()
                    }) {
                       Text("Add New")
                    }
                })
            }
        }
    }
}

#Preview {
    ContentView()
}
