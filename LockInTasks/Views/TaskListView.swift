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
    
    
//    @Query(animation: .smooth) private var tasks: [TaskModel]
    @Query(
        filter: #Predicate<TaskModel> { task in
            task.isCompleted == false
        },
        animation: .smooth
    )
    var incompleteTasks: [TaskModel]
    
    @Query(
        filter: #Predicate<TaskModel> { task in
            task.isCompleted == true
        },
        animation: .smooth
    )
    var completeTasks: [TaskModel]
    
    let date = Calendar.current.startOfDay(for: Date())
    let defaults = UserDefaults.standard
    
    var body: some View {
        VStack{
            NavigationStack{
                List{
                    ForEach (incompleteTasks){ task in
                            TaskRowView(task: task)
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
                }.onAppear(){
                    //reset tasks every day
                    let lastRun = defaults.object(forKey: "AppLastRun") as? Date
                    if lastRun != date {
                        for task in completeTasks{
                            task.isCompleted = false
                        }
                        defaults.set(date, forKey: "AppLastRun")
                    }
                }
            }
        }
    }
}

#Preview {
    TaskListView()
}
