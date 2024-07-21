//
//  TaskEditorView.swift
//  LockInTasks
//
//  Created by Csaba Kiss on 21/07/2024.
//

import SwiftUI

struct TaskEditorView: View {
    
    let task: TaskItemModel?
    
    private var editorTitle: String {
        task == nil ? "Add Task" : "Edit Task"
    }
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var title = ""
    @State private var desc = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                VStack{
                    ZStack{
                        if $desc.wrappedValue.isEmpty {
                            HStack{
                                Text("Description").foregroundStyle(.tertiary).padding(.bottom, 80)
                                Spacer()
                            }
                        }
                        TextEditor(text: $desc).frame(minHeight: 100).padding(.leading, -5)
                    }
                }
                Button(action: {
                    
                }, label: {
                    HStack{
                        Spacer()
                        Text("Delete").tint(.red)
                        Spacer()
                    }
                    
                })
            }
            .onAppear(){
                if let task {
                    title = task.title
                    desc = task.desc
                }
            }
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text(editorTitle)
                }
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        //save the changes and dismiss window
                        withAnimation{
                            save()
                            dismiss()
                        }
                    }
                }
            }
        }
    }
    
    private func save() {
        if let task {
            //we're editing a task so
            task.title = title
            task.desc = desc
        }
        else{
            //we're creating a task so
            let newTask = TaskItemModel(title: title, desc: desc)
            context.insert(newTask)
        }
    }
}

#Preview {
    TaskEditorView(task: nil)
}
