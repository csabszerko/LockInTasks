//
//  TaskOperations.swift
//  LockInTasks
//
//  Created by Csaba Kiss on 20/07/2024.
//

import Foundation
import SwiftData

class TaskOperations {
    private var context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func addTask(title: String, description: String) {
        let task = TaskItemModel(title: title, desc: description)
        context.insert(task)
        try? context.save()
    }
    
    func deleteTask(_ task: TaskItemModel) {
        context.delete(task)
        try? context.save()
    }
    
    func updateTask(_ task: TaskItemModel) {
        try? context.save()
    }
}
