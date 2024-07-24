//
//  TaskOperations.swift
//  LockInTasks
//
//  Created by Csaba Kiss on 20/07/2024.
//

import Foundation
import SwiftData

extension TaskItemModel{
    
    static func addTask(title: String, description: String, context: ModelContext) {
        let task = TaskItemModel(title: title, desc: description)
        context.insert(task)
    }
    
    static func addTask(_ task: TaskItemModel, context: ModelContext) {
        context.insert(task)
    }
    
    static func deleteTask(_ task: TaskItemModel, context: ModelContext) {
        context.delete(task)
    }
    
    static func updateTask(_ task: TaskItemModel, context: ModelContext) {
    }
}
