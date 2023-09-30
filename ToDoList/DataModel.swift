//
//  DataModel.swift
//  ToDoList
//
//  Created by Logicfocus Techonology Solution on 29/09/23.
//

import Foundation
import SwiftData

@Model
final class DataModel {
    var title: String
    var time: Date
    var isImportant: Bool
    var isFinished: Bool
    
    init(title: String = "", time: Date = .now, isImportant: Bool = false, isFinished: Bool = false) {
        self.title = title
        self.time = time
        self.isImportant = isImportant
        self.isFinished = isFinished
    }
}
