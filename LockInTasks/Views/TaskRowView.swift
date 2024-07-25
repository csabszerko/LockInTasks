//
//  TaskRowView.swift
//  LockInTasks
//
//  Created by Csaba Kiss on 21/07/2024.
//

import SwiftUI

struct TaskRowView: View {
    var task: TaskModel
    
    var body: some View {
        Group{
            if task.desc.isEmpty {
                Text(task.title).swipeMenu(task)
            }
            else{
                DisclosureGroup(
                    content: { Text(task.desc).foregroundColor(.secondary).font(.caption) },
                    label: { Text(task.title).swipeMenu(task) }
                )
            }
        }
    }
}
