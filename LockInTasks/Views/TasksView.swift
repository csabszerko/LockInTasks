//
//  TasksView.swift
//  LockInTasks
//
//  Created by Csaba Kiss on 20/07/2024.
//

import SwiftUI

struct TasksView: View {
    var body: some View {
        Button(action: {
            TaskListView()
        }, label: {
            Image(systemName: "square.and.pencil")
        })
    }
    
}

#Preview {
    TasksView()
}
