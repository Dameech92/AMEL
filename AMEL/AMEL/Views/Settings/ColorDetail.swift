//
//  ColorDetail.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/17/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct ColorDetail: View {
    @Environment(\.managedObjectContext) var context
    let color: String
    @ObservedObject var buttonData: ButtonData
    let viewModel: SettingsViewModel
    let colorNames = Colors().colorNames
    let button: CustomButton
    var body: some View {
        HStack {
            Image(systemName: self.color == self.colorNames[self.buttonData.color] ? "circle.fill": "circle")
            Text(self.color)
            Spacer()
            Rectangle()
                .fill(Color(self.color))
                .frame(width:40, height: 40)
                .cornerRadius(5)
        }.onTapGesture {
            self.viewModel.updateButton(name: self.buttonData.name, color: Colors().colorToInt(color: self.color), button: self.button, context: self.context)
        }
    }
}
