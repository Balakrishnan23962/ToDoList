//
//  DataListView.swift
//  ToDoList
//
//  Created by Logicfocus Techonology Solution on 30/09/23.
//

import SwiftUI

struct DataListView: View {
    var item: DataModel
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                if item.isImportant {
                    Image(systemName: "exclamationmark.circle")
                        .symbolVariant(.fill)
                        .foregroundStyle(.green)
                        .font(.largeTitle)
                        .bold()
                }
                Text(item.title)
                Text("\(item.time, format: Date.FormatStyle(date: .numeric, time: .shortened))")
                    .font(.callout)
            }
            Spacer()
            Button(action: {
                withAnimation {
                    item.isFinished.toggle()
                }
            }, label: {
                Image(systemName: "checkmark")
                    .symbolVariant(.circle.fill)
                    .foregroundStyle(item.isFinished ? .green : .gray)
                    .font(.largeTitle)
            })
            .buttonStyle(.plain)
        }
    }
}

