//
//  SettingsView.swift
//  AMEL
//
//  Created by Jeffrey Romero on 4/10/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
	@State private var colorIndex = 0
	@FetchRequest(fetchRequest: CustomButton.getCustomButton()) var customButton:FetchedResults<CustomButton>
	@Environment(\.managedObjectContext) var managedObjectContext
    var body: some View {
        let viewModel = SettingsViewModel(savedButtons: self.customButton)
        return VStack {
            HStack(alignment: .center) {
                // add a new button to the record events page
                Button(action: {
					let newButton = viewModel.createCustomButton(managedObjectContext: self.managedObjectContext)
					viewModel.saveCustomButton(newButton: newButton, buttonName: "Default", buttonColor: "Blue", managedObjectContext: self.managedObjectContext)
                }) {
                    VStack {
                        Text("Add new button")
                        Image(systemName: "plus.square.fill")
                    }
                }.foregroundColor(.primary)

                Divider()
            }.frame(height:60)
			
            List {
                ForEach(self.customButton, id: \.index) { button in
                    ButtonRow(button: button, customButtons: self.customButton, buttonData: ButtonData(button: button))
                    }.onDelete { indexSet in
						if indexSet.first != nil {
							let deleteButton = self.customButton[indexSet.first!]
							self.managedObjectContext.delete(deleteButton)
							
							print("Deleting button at position \(indexSet.first!)")
							for i in indexSet.first!...self.customButton.count - 1 {
								self.customButton[i].index = (i - 1) as NSNumber
							}
							
							viewModel.saveCustomButtons(managedObjectContext: self.managedObjectContext)
						}
					}
            }
        }
    }
}

#if DEBUG
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
#endif
