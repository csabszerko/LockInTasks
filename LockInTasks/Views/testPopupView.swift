//
//  testPopupView.swift
//  LockInTasks
//
//  Created by Csaba Kiss on 20/07/2024.
//

import SwiftUI

struct testPopupView: View {
    @Binding var isPresented: Bool
    @State private var firstInput = ""
    @State private var secondInput = ""
    
    var body: some View {
        VStack {
            Text("what's your excuse?")
                .font(.headline)
            
            TextField("title", text: $firstInput)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                            
            TextEditor(text: $secondInput)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .frame(height: 200) // Adjust the height as needed
            
            Text({
                            let formatter = DateFormatter()
                            formatter.dateFormat = "EEEE, MMMM d, yyyy" // Custom format with day of the week
                            return formatter.string(from: Date())
                        }())
                        .padding()
            
            HStack{
                Button(action: {
                    print("First Input: \(self.firstInput)")
                    print("Second Input: \(self.secondInput)")
                    self.isPresented = false
                }) {
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
    testPopupView(isPresented: .constant(true))
}
