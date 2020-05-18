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
        VStack(spacing: 0){
            Text("Settings")
                .font(.title)
                .padding(.top)
            HStack{
                SettingsClear()
                    .padding(.leading, 30)
                Spacer()
                SettingsAddButton(viewModel: self.viewModel)
                    .padding(.trailing, 30)
            }.padding(.bottom, 30)
        }
        .background(Color("buttonBackGround"))
        
    }
}
