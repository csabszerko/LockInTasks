//
//  TaskSwipeMenu.swift
//  LockInTasks
//
//  Created by Csaba Kiss on 21/07/2024.
//

import SwiftUI

struct TaskSwipeMenu: ViewModifier {
    var task: TaskItemModel
    
    func body(content: Content) -> some View {
        content
            .swipeActions{
                if(!task.isCompleted){ 
                    Button(action: {
                        withAnimation(){
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

extension View {
    func swipeMenu(_ task: TaskItemModel) -> some View {
        modifier(TaskSwipeMenu(task: task))
    }
}
