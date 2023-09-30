//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Logicfocus Techonology Solution on 29/09/23.
//

import SwiftUI
import SwiftData
@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: DataModel.self)
        }
    }
}
