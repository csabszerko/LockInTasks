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
            HStack{
                Spacer()
                Button(action: {
                    //popup to add task
                    self.isPresented = true
                }, label: {
                    Text("add a note")
                    Image(systemName: "square.and.pencil")
                })
                .sheet(isPresented: $isPresented) {
                    PopupView(isPresented: self.$isPresented)
                }
            }.padding()
            
            List{
                ForEach (tasks){ task in
                    HStack{
                        Toggle(isOn: Binding(
                            get: { task.isCompleted },
                            set: { checkValue in
                                task.isCompleted = checkValue
                                try? context.save()
                            }
                        ), label: {
                            Text(task.title)
                        })
                        .toggleStyle(CustomCheckBoxView())
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        task.isCompleted.toggle()
                        try? context.save()
                    }
                    .swipeActions{
                        Button(action: {
                            withAnimation{
                                taskOperations.deleteTask(task)
                            }
                        }, label: {
                            Image(systemName: "trash")
                        })
                        .tint(.red)
                        
                        Button(action: {
                            taskOperations.addTask(title: "sample", description: "sample")
                        }, label: {
                            Image(systemName: "square.and.pencil")
                        })
                        .tint(.yellow)
                    }
                }
            }
        }
    }
}

#Preview {
    TasksView()
}
