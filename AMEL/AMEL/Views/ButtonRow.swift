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
    let context: NSManagedObjectContext
    var customButtons: FetchedResults<CustomButton>
	@ObservedObject var buttonData: ButtonData
    private let colorNames = ["Red", "Green", "Blue", "Purple", "Orange", "Gray"]
    
    var body: some View {
        let viewModel = SettingsViewModel(savedButtons: self.customButtons)
        if buttonData.updated {
            viewModel.updateButton(name: buttonData.name, color: buttonData.color, button: self.button, context: self.context)
            buttonData.updated = false
        }
        return HStack{
            TextField("Enter button name", text: self.$buttonData.name, onCommit: {
                self.buttonData.updated = true
            })
            Picker(selection: self.$buttonData.color, label: Text("Color")) {
                ForEach(0 ..< self.colorNames.count) {
                    Rectangle()
                        .fill(Color(self.colorNames[$0])).tag($0)
                        .frame(width:20, height: 20)
                }
            }
        }
    }
}

