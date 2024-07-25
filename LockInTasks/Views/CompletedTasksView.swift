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
    
    //    @Query private var tasks: [TaskModel]
    @Query(
        filter: #Predicate<TaskModel> { task in
            task.isCompleted == true
        },
        animation: .smooth
    ) var completeTasks: [TaskModel]
    
    var body: some View {
        VStack{
            NavigationStack{
                List{
                    ForEach (completeTasks){ task in
                        TaskRowView(task: task)
                    }.onDelete(perform: { indexSet in
                        for index in indexSet{
                            context.delete(completeTasks[index])
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
