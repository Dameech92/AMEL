//
//  SettingsAddButton.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/17/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct SettingsAddButton: View {
    let viewModel: SettingsViewModel
    @Environment(\.managedObjectContext) var managedObjectContext
    var body: some View {
        Button(action: {
            let newButton = self.viewModel.createCustomButton(managedObjectContext: self.managedObjectContext)
            self.viewModel.saveCustomButton(newButton: newButton, buttonName: "Default", buttonColor: "Blue", managedObjectContext: self.managedObjectContext)
        }) {
            VStack {
                Text("Add new button")
                Image(systemName: "plus.square.fill")
            }
        }.foregroundColor(.primary)
    }
}
