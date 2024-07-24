//
//  CompletedTasksView.swift
//  LockInTasks
//
//  Created by Csaba Kiss on 24/07/2024.
//

import SwiftUI
import SwiftData

struct CompletedTasksView: View {
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
                        if(task.isCompleted){
                            TaskRowView(task: task)
                        }
                    }.onDelete(perform: { indexSet in
                        for index in indexSet{
                            context.delete(tasks[index])
                        }
                    })
                }
                .toolbar{
                    ToolbarItem(placement: .principal){
                        Text("History")
                    }
                }
            }
        }
    }
}

#Preview {
    CompletedTasksView()
}
