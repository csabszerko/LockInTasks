//
//  ShowSheetButtonView.swift
//  LockInTasks
//
//  Created by Csaba Kiss on 24/07/2024.
//

import SwiftUI

struct ShowSheetButtonView<Content: View>: View {
    @State private var isSheetPresented = false
        let buttonText: String
        let sheetContent: Content

        init(buttonText: String, @ViewBuilder sheetContent: () -> Content) {
            self.buttonText = buttonText
            self.sheetContent = sheetContent()
        }

        var body: some View {
            Button(action: {
                isSheetPresented.toggle()
            }) {
                Text(buttonText)
            }
            .sheet(isPresented: $isSheetPresented) {
                sheetContent
            }
        }
}
