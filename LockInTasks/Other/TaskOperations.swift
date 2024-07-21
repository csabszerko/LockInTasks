//
//  TaskOperations.swift
//  LockInTasks
//
//  Created by Csaba Kiss on 20/07/2024.
//

import Foundation
import SwiftData

class TaskOperations{
    private var context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func addTask(title: String, description: String) {
        let task = TaskItemModel(title: title, desc: description)
        context.insert(task)
    }
    
    func addTask(_ task: TaskItemModel) {
        context.insert(task)
    }
    
    func deleteTask(_ task: TaskItemModel) {
        context.delete(task)
    }
    
    func updateTask(_ task: TaskItemModel) {
    }
}
