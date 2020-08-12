//
//  SettingsHeader.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/17/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct SettingsHeader: View {
    let viewModel: SettingsViewModel
    var body: some View {
        return HStack {
            SettingsClear()
            Spacer()
            VStack{
                Text("Settings")
                    .font(.title)
                Text(self.viewModel.getNumberOfButtons())
                    .font(.headline)
            }
            Spacer()
            SettingsAddButton(viewModel: self.viewModel)
        }.padding()
        
    }
}
