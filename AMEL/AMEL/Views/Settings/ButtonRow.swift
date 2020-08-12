//
//  ButtonRow.swift
//  AMEL
//
//  Created by Dimitri Cognata on 4/18/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//
import SwiftUI
import CoreData
import Combine
struct ButtonRow: View {
    @Environment(\.horizontalSizeClass) var widthSizeClass
    @Environment(\.verticalSizeClass) var heightSizeClass
    let button: CustomButton
    @Environment(\.managedObjectContext) var context
    var customButtons: FetchedResults<CustomButton>
	@ObservedObject var buttonData: ButtonData
    private let colorNames = Colors().colorNames
    @State var showingDetail = false
    var body: some View {
        let smallFont = widthSizeClass == .compact
        let viewModel = SettingsViewModel(savedButtons: self.customButtons, managedObjectContext: self.context)
        if buttonData.updated {
			viewModel.updateButton(name: self.buttonData.name, color: self.buttonData.color, button: self.button)
			self.buttonData.updated = false
        }
        return HStack{
            Spacer()
            Text("Button Name: ")
            GeometryReader { g in
                TextField("", text: self.$buttonData.name, onEditingChanged: {_ in
                    self.buttonData.updated = true
                }, onCommit: {
                    self.buttonData.updated = true
                })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: g.size.width - 20)
            }

            Spacer()
            Button(action: {
                self.showingDetail.toggle()
            }) {
                Text("Select Color")
                    .foregroundColor(Color.blue)
            }.sheet(isPresented: self.$showingDetail) {
                ColorSelector(buttonData: self.buttonData, button: self.button, viewModel: viewModel)
            }
            Rectangle()
                .fill(Color(self.colorNames[self.buttonData.color]))
                .frame(width:40, height: 40)
                .cornerRadius(5)
        }.font(smallFont ? .body : .largeTitle)
    }
}

