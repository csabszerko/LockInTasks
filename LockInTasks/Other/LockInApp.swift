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
    let date = Calendar.current.startOfDay(for: Date())
    let defaults = UserDefaults.standard
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
        .modelContainer(for: TaskModel.self, isAutosaveEnabled: true)
        .onChange(of: scenePhase) { oldPhase, newPhase in
                        if newPhase == .active {
                            print("Active")
                        } else if newPhase == .inactive {
                            print("Inactive")
                        } else if newPhase == .background {
                            print("Background")
                        }
                    }
    }
}
