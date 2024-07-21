//
//  TaskRowView.swift
//  LockInTasks
//
//  Created by Csaba Kiss on 21/07/2024.
//

import SwiftUI

struct TaskRowView: View {
    var task: TaskItemModel
    
    var body: some View {
        if !task.isCompleted {
            Group{
                if task.desc.isEmpty {
                    Text(task.title).swipeMenu(task)
                }
                else{
                    DisclosureGroup(
                        content: { Text(task.desc) },
                        label: { Text(task.title).swipeMenu(task) }
                    )
                }
            }
        }
    }
}
