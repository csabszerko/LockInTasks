//
//  TasksView.swift
//  LockInTasks
//
//  Created by Csaba Kiss on 20/07/2024.
//

import SwiftUI
import SwiftData

struct TaskListView: View {
    @State private var isPresented = false
    
    @Environment(\.modelContext) private var context
    private var taskOperations: TaskOperations {
        TaskOperations(context: context)
    }
    
    @Query private var tasks: [TaskItemModel]
    
    var body: some View {
        VStack{
            NavigationStack{
                List{
                    ForEach (tasks){ task in
                        if(!task.isCompleted){
                            TaskRowView(task: task)
                        }
                    }
                }
                .toolbar{
                    ToolbarItem(placement: .principal){
                        Text("Tasks")
                    }
                    
                    ToolbarItem(placement: .confirmationAction){
                        NavigationLink(destination: TaskEditorView(task: nil), label: {
                            Text("Add")
                        })
                    }
                    
                    ToolbarItem(placement: .cancellationAction){
                        ShowSheetButtonView(buttonText: "History", sheetContent: {
                            CompletedTasksView()
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    TaskListView()
}
