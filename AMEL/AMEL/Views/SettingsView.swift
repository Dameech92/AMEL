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
	private let colors = ["Red", "Green", "Blue"]
	
    var body: some View {
		ZStack {
			Color("stealth").edgesIgnoringSafeArea(.all)
			
			VStack {
				
				// ADD/REMOVE BUTTONS HERE FOR TESTING RIGHT NOW. SUBJECT TO CHANGE.
				Text("Number of buttons: \(self.userSettings.numOfButtons)")
				Text("Color index for button 1: \(self.userSettings.colorIndexes[0])")
				HStack {
					// adds a new button to the record events page
					Button(action: {
						UserDefaults.standard.set(self.userSettings.numOfButtons + 1, forKey: "numOfButtons")
						self.userSettings.buttonNames.append(CustomButton("New Button", UIColor.blue))
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
					for i in 0...self.userSettings.numOfButtons - 1 {
						print("\(self.userSettings.buttonNames[i].getButtonName())")
						self.userSettings.buttonNames[i].setButtonName("Button \(i)")
						print("\(self.userSettings.buttonNames[i].getButtonName())")
					}
				}) {
					Image(systemName: "textbox")
				}.padding(10)
				
				// Temporary function that prints out all of the stored button names.
				Button(action: {
					for i in 0...self.userSettings.numOfButtons - 1 {
						print(self.userSettings.buttonNames[i].getButtonName())
					}
					print()
				}) {
					Image(systemName: "textformat.abc")
				}.padding(10)
				
				Divider()
				
				NavigationView {
					Form {
						Section {
							Picker(selection: self.$userSettings.colorIndexes[0], label: Text("\(self.userSettings.buttonNames[0].getButtonName())")) {
								LabelTextField(0)
									
								ForEach(0 ..< self.userSettings.colors.count) {
									Text(self.userSettings.colors[$0]).tag($0)
								}
							}
						}
						Section {
							Picker(selection: self.$userSettings.colorIndexes[1], label: Text("\(self.userSettings.buttonNames[1].getButtonName())")) {
								LabelTextField(1)
								
								ForEach(0 ..< colors.count) {
									Text(self.colors[$0]).tag($0)
								}
							}
						}
						Section {
							Picker(selection: self.$userSettings.colorIndexes[2], label: Text("\(self.userSettings.buttonNames[2].getButtonName())")) {
								LabelTextField(2)
								
								ForEach(0 ..< colors.count) {
									Text(self.colors[$0]).tag($0)
								}
							}
						}
						Section {
							Picker(selection: self.$userSettings.colorIndexes[3], label: Text("\(self.userSettings.buttonNames[3].getButtonName())")) {
								LabelTextField(3)
								
								ForEach(0 ..< colors.count) {
									Text(self.colors[$0]).tag($0)
								}
							}
						}
						Section {
							Picker(selection: self.$userSettings.colorIndexes[4], label: Text("\(self.userSettings.buttonNames[4].getButtonName())")) {
								LabelTextField(4)
								
								ForEach(0 ..< colors.count) {
									Text(self.colors[$0]).tag($0)
								}
							}
						}
						Section {
							Picker(selection: self.$userSettings.colorIndexes[5], label: Text("\(self.userSettings.buttonNames[5].getButtonName())")) {
								LabelTextField(5)
								
								ForEach(0 ..< colors.count) {
									Text(self.colors[$0]).tag($0)
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
