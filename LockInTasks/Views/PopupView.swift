//
//  testPopupView.swift
//  LockInTasks
//
//  Created by Csaba Kiss on 20/07/2024.
//

import SwiftUI
import SwiftData

struct PopupView: View {
    @Binding var isPresented: Bool
    @State private var firstInput: String = ""
    @State private var secondInput: String  = ""
    
    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack {
            Text("what do you need to get done?")
                .font(.headline).padding()
            
            TextField("title", text: $firstInput)
                .padding()
                .textFieldStyle(DefaultTextFieldStyle())
            //                .overlay(
            //                    RoundedRectangle(cornerRadius: 10)
            //                        .stroke(Color.gray, lineWidth: 1)
            //                )
            TextField("description", text: $secondInput)
                .padding()
                .textFieldStyle(DefaultTextFieldStyle())
            //                .overlay(
            //                    RoundedRectangle(cornerRadius: 10)
            //                        .stroke(Color.gray, lineWidth: 1)
            //                )
            
            //            TextEditor(text: $secondInput)
            //                .padding(10)
            //                .overlay(
            //                    RoundedRectangle(cornerRadius: 10)
            //                        .stroke(Color.gray, lineWidth: 1)
            //                )
            //                .frame(height: 100)
            
            Text({
                let formatter = DateFormatter()
                formatter.dateFormat = "EEEE, MMMM d, yyyy"
                return formatter.string(from: Date())
            }())
            .padding()
            
            HStack{
                Button(action: {
                    withAnimation{
//                        TaskOperations.addTask(title: self.firstInput, description: self.secondInput)
                    }
                    self.isPresented = false
                }){
                    Text("Submit")
                }
                .padding()
                
                Button(action: {
                    self.isPresented = false
                }) {
                    Text("Cancel")
                        .foregroundColor(.red)
                }
                .padding()
            }
        }.padding()
    }
}

#Preview {
    PopupView(isPresented: .constant(true))
}
