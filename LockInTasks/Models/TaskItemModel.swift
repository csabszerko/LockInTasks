//
//  TaskModel.swift
//  LockInTasks
//
//  Created by Csaba Kiss on 20/07/2024.
//

import Foundation
import SwiftData

@Model
class TaskModel : Identifiable{
    
    var id: UUID
    var title: String
    var desc: String
    var isCompleted: Bool
    
    init(title: String, desc: String) {
        self.id = UUID()
        self.title = title
        self.desc = desc
        self.isCompleted = false
    }
}
