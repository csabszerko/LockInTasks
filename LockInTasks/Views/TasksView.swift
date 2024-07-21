//
//  TasksView.swift
//  LockInTasks
//
//  Created by Csaba Kiss on 20/07/2024.
//

import SwiftUI
import SwiftData

struct TasksView: View {
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
                        if !task.isCompleted {
                            DisclosureGroup(
                                content: { Text(task.desc) },
                                label: { Text(task.title) }
                            )
                            .swipeActions{
                                Button(action: {
                                    withAnimation(.bouncy){
                                        task.isCompleted = true
                                    }
                                }, label: {
                                    Image(systemName: "checkmark")
                                })
                                .tint(.green)
                                
                                NavigationLink(
                                    destination: TaskEditorView(task: task),
                                    label: {
                                        Image(systemName: "pencil")
                                    }
                                )
                            }
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
                }
            }
        }
    }
}

#Preview {
    TasksView()
}
