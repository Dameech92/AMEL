//
//  SettingsClear.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/17/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct SettingsClear: View {
    @FetchRequest(fetchRequest: CustomButton.getCustomButton()) var customButtons:FetchedResults<CustomButton>
    @Environment(\.managedObjectContext) var managedObjectContext
    var body: some View {
        let viewModel = SettingsViewModel(savedButtons: self.customButtons, managedObjectContext: self.managedObjectContext)
        return Button(action: {
            viewModel.deleteAllCustomButtons()
            
        }) {
            Text("Clear All")
        }
    }
}
