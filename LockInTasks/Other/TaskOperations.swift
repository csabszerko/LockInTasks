//
//  TaskOperations.swift
//  LockInTasks
//
//  Created by Csaba Kiss on 20/07/2024.
//

import Foundation
import SwiftData
import SwiftUI

extension TaskModel {
    
    static func addTask(title: String, description: String, context: ModelContext) {
        let task = TaskModel(title: title, desc: description)
        context.insert(task)
    }
    
    static func addTask(_ task: TaskModel, context: ModelContext) {
        context.insert(task)
    }
    
    static func deleteTask(_ task: TaskModel, context: ModelContext) {
        context.delete(task)
    }
    
    static func updateTask(_ task: TaskModel, context: ModelContext) {
    }
}
