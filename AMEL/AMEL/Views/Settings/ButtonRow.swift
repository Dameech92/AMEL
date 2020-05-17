//
//  ButtonRow.swift
//  AMEL
//
//  Created by Dimitri Cognata on 4/18/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//
import SwiftUI
import CoreData
struct ButtonRow: View {
    let button: CustomButton
    @Environment(\.managedObjectContext) var context
    var customButtons: FetchedResults<CustomButton>
	@ObservedObject var buttonData: ButtonData
    private let colorNames = Colors().colorNames
    @State var showingDetail = false
    var body: some View {
        let viewModel = SettingsViewModel(savedButtons: self.customButtons)
        if buttonData.updated {
			viewModel.updateButton(name: self.buttonData.name, color: self.buttonData.color, button: self.button, context: self.context)
			self.buttonData.updated = false
        }
        return HStack{
            Text("Name: ")
            TextField("Enter button name", text: self.$buttonData.name, onCommit: {
				self.buttonData.updated = true
            })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 200)
            Button(action: {
                self.showingDetail.toggle()
            }) {
                Text("Select Color")
            }.sheet(isPresented: $showingDetail) {
                ColorSelector(buttonData: self.buttonData, viewModel: viewModel, button: self.button)
            }
        }
    }
}

