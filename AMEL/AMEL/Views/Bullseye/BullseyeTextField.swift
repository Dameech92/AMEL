//
//  BullseyeTextField.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/2/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI
import Combine
struct BullseyeTextField: View {
    @Binding var data: String
    @Binding var error: Bool
    let refAction: ReferencePointAction
    let numberInputs = "-.0123456789"
    var body: some View {
        TextField("Degrees", text: self.$data)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
            .onReceive(Just(self.data)) { newValue in
                    let filtered = newValue.filter { self.numberInputs.contains($0) }
                    if filtered != newValue {
                        self.data = filtered
                    }
                self.refAction.updateLatitudePicker(latitude: self.data)
                }
        .overlay(self.error ? Text("Out of range").foregroundColor(Color.red).padding() : nil, alignment: .trailing)
    }
}

