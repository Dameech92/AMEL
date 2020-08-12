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
    let pickerUpdater: PickerUpdater
    let numberInputs = "-.0123456789"
    var body: some View {
        VStack {
            TextField(!self.error ? "Degrees" : "", text: self.$data)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onReceive(Just(self.data)) { newValue in
                        if(!newValue.isEmpty && self.error){
                            self.error = false
                        }
                        let filtered = newValue.filter { self.numberInputs.contains($0)}
                        if filtered != newValue {
                            self.data = filtered
                        }
                        self.pickerUpdater.updatePicker(latOrLng: self.data)
                    }
                    .overlay(self.error ? RoundedRectangle(cornerRadius: 5).stroke(Color.red, lineWidth: 1) : nil)
            Text("Out of range")
                .opacity(self.error ? 1 : 0)
                .foregroundColor(Color.red)
                .font(.footnote)
        }
    }
}

