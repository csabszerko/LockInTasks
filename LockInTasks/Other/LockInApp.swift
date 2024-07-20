//
//  LockInTasksApp.swift
//  LockInTasks
//
//  Created by Csaba Kiss on 19/07/2024.
//

import SwiftUI
import SwiftData

@main
struct LockInTasksApp: App {
    var body: some Scene {
        WindowGroup {
            TasksView()
        }.modelContainer(for: TaskItemModel.self)
    }
}
