//
//  CustomCheckBoxView.swift
//  LockInTasks
//
//  Created by Csaba Kiss on 20/07/2024.
//

import SwiftUI

struct CustomCheckBoxView: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
            //                .resizable()
            //                .frame(width: 20, height: 20)
            //                .onTapGesture {
            //                    configuration.isOn.toggle()
            //                }
        }
    }
}
