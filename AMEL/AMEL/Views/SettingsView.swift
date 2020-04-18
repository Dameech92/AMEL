//
//  SettingsView.swift
//  AMEL
//
//  Created by Jeffrey Romero on 4/10/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
	@EnvironmentObject var userSettings:UserSetting
	private let colorNames = ["Red", "Green", "Blue"]
	private let colors = [UIColor.red, UIColor.green, UIColor.blue]
	
	@FetchRequest(fetchRequest: CustomButton.getCustomButton()) var customButton:FetchedResults<CustomButton>
	@Environment(\.managedObjectContext) var managedObjectContext
	
    var body: some View {
		let viewModel = SettingsViewModel()
		let buttonList: [CustomButton] = viewModel.getCustomButtons(buttons: customButton, managedObjectContext: self.managedObjectContext)
		
		return ZStack {
			Color("stealth").edgesIgnoringSafeArea(.all)
			
			VStack(alignment: .leading) {
				
				// ADD/REMOVE BUTTONS HERE FOR TESTING RIGHT NOW. SUBJECT TO CHANGE.
				Text("Number of buttons: \(self.userSettings.numOfButtons)")
				Text("Color index for button 1: \(self.userSettings.colorIndexes[0])")
				HStack {
					// adds a new button to the record events page
					Button(action: {
						UserDefaults.standard.set(self.userSettings.numOfButtons + 1, forKey: "numOfButtons")
						self.userSettings.buttonNames.append("Button")
					}) {
						VStack {
							Text("Add new button").foregroundColor(.primary)
							Text("array length: \(self.userSettings.buttonNames.count)")
							Image(systemName: "plus.square.fill")
						}
					}
					
					Divider()
					
					// removes a button from the record events page
					Button(action: {
						if self.userSettings.numOfButtons > 1 {
							self.userSettings.buttonNames.remove(at: self.userSettings.numOfButtons - 1)
							UserDefaults.standard.set(self.userSettings.numOfButtons - 1, forKey: "numOfButtons")
						} else {
							print("cannot have less than 1 button")
						}
					}) {
						VStack {
							Text("Remove button").foregroundColor(.primary)
							Image(systemName: "minus.square.fill")
						}
					}
					
					
					
					
				}.frame(height:60)
				
				// Temporary function that renames all of the stored button names.
				Button(action: {
					for i in 0...buttonList.count - 1 {
						print("Renaming \"\(buttonList[i].buttonName!)\" to:")
						buttonList[i].buttonName! = "Button \(i)"
						print("\(buttonList[i].buttonName!)")
						print()
					}
					viewModel.saveCustomButtons(managedObjectContext: self.managedObjectContext)
				}) {
					Image(systemName: "textbox")
				}.padding(10)
				
				// Temporary function that prints out all of the stored button names.
				Button(action: {
					for i in 0...buttonList.count - 1 {
						print("\(buttonList[i].buttonName!)")
					}
					print()
				}) {
					Image(systemName: "textformat.abc")
				}.padding(10)
				
				Divider()
				
				NavigationView {
					Form {
						ForEach((0 ..< buttonList.count - 1), id: \.self) { i in
							Picker(selection: self.$userSettings.colorIndexes[i], label: Text("\(buttonList[i].buttonName!)")) {
								LabelTextField(i)

								ForEach(0 ..< self.colors.count - 1) {
									Text(self.colorNames[$0]).tag($0)
								}
							}
						}.onDelete { indexSet in
						   if indexSet.first != nil {
							   let deleteButton = self.customButton[indexSet.first!]
							   self.managedObjectContext.delete(deleteButton)
							   do {
								   try self.managedObjectContext.save()
							   } catch {
									   print(error)
							   }
						   }
						}
					}.navigationBarTitle(Text("Button List"))
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
