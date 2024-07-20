//
//  ContentView.swift
//  LockInTasks
//
//  Created by Csaba Kiss on 19/07/2024.
//

import SwiftUI

struct TaskListView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "lock.fill")
//                .imageScale(.large).font(.system(size: 30))
//            Text("it's time to lock in").font(.system(.largeTitle))
//        }
//        .padding()
//    }
    
    @State private var isPresented = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.isPresented = true
            }) {
                Text("Show Popup")
            }
        }
        .sheet(isPresented: $isPresented) {
            testPopupView(isPresented: self.$isPresented)
        }
    }
}

#Preview {
    TaskListView()
}
