//
//  SettingsHeader.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/17/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct SettingsHeader: View {
    @Environment(\.horizontalSizeClass) var widthSizeClass
    @Environment(\.verticalSizeClass) var heightSizeClass
    let viewModel: SettingsViewModel
    var body: some View {
        return HStack {
            SettingsClear()
            Spacer()
            if widthSizeClass == .compact || heightSizeClass == .compact {
                VStack{
                    Text("Settings")
                        .font(.title)
                    Text(self.viewModel.getNumberOfButtons())
                        .font(.body)
                }.padding(.top, 40)
            } else {
                VStack{
                    Text("Settings")
                        .font(.title)
                    Text(self.viewModel.getNumberOfButtons())
                        .font(.title)
                }
            }
            
            Spacer()
            SettingsAddButton(viewModel: self.viewModel)
        }.padding()
        .background(Color("buttonBackGround"))
        
    }
}
