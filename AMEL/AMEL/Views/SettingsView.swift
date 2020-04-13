//
//  SettingsView.swift
//  AMEL
//
//  Created by Jeffrey Romero on 4/10/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
//	@ObservedObject var settingsViewModel = SettingsViewModel()
	
//	@FetchRequest(fetchRequest: UserSetting.getUserSettings()) var userSettings:FetchedResults<UserSetting>
//	@Environment(\.managedObjectContext) var managedObjectContext
	
//	@State private var newUserSetting = ""
	
	@EnvironmentObject var userSettings:UserSetting
	// retrieve stored userNumOfButtons from UserDefaults
	@State public var userNumOfButtons = UserDefaults.standard.integer(forKey: "numOfButtons")
	
//	@ObservedObject var textBindingManager = TextBindingManager()
	
	private let defaultButtonNames:[String] = ["Button 1", "Button 2", "Button 3", "Button 4", "Button 5", "Button 6", "Button 7", "Button 8", "Button 9", "Button 10"]
//	private let defaultButtonColorIndex:[Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	
	// Cast the array of type [Any]? to [String] using: "as? [String] ?? [String]()"
//	@State private var buttonNames = UserDefaults.standard.array(forKey: "buttonNames") as? [String] ?? [String]()
	
	public var colors = ["Red", "Green", "Blue"]
//	@State private var buttonColorIndex = UserDefaults.standard.array(forKey: "buttonColorIndex") as? [Int] ?? [Int]()
	
//	let savedArray = UserDefaults.standard.array(forKey:"buttonNames") as? [String] ?? [String]()
	
//	init() {
//		if !self.userSettings.firstTimeSetupWasPerformed {
//			print("No custom user settings found. Performing first time setup.")
//
//			UserDefaults.standard.set(self.defaultButtonNames, forKey: "buttonNames")
//			UserDefaults.standard.set(self.defaultButtonColorIndex, forKey: "buttonColorIndex")
//			UserDefaults.standard.set(true, forKey: "initialSetup")
//
//		} else {
//			print("Custom user settings found.")
//		}
//	}
	
    var body: some View {
		ZStack {
			Color("stealth").edgesIgnoringSafeArea(.all)
			
			VStack {
				
				// ADD/REMOVE BUTTONS HERE FOR TESTING RIGHT NOW. SUBJECT TO CHANGE.
				Text("Number of buttons: \(self.userSettings.numOfButtons)")
				HStack {
					// adds a new button to the record events page
					Button(action: {
						self.userSettings.numOfButtons += 1
//						UserDefaults.standard.set(self.numOfButtons.numOfButtons + 1, forKey: "numOfButtons")
						
					}) {
						VStack {
							Text("Add new button").foregroundColor(.primary)
//							Text("array length: \(self.buttonNames.count)")
							Image(systemName: "plus.square.fill")
						}
					}
					
					Divider()
					
					// removes a button from the record events page
					Button(action: {
						if self.userSettings.numOfButtons > 0 {
							self.userSettings.numOfButtons -= 1
						} else {
							print("cannot have less than 1 button")
						}
//						UserDefaults.standard.set(self.userNumOfButtons, forKey: "numOfButtons")
					}) {
						VStack {
							Text("Remove button").foregroundColor(.primary)
							Image(systemName: "minus.square.fill")
						}
					}
				}.frame(height:60)
				
				// Temporary function that renames all of the stores button names.
				Button(action: {
					for i in 0...self.userSettings.numOfButtons - 1 {
						print("\(self.userSettings.buttonNames[i])")
						self.userSettings.buttonNames[i] = "Button \(i)"
						print("\(self.userSettings.buttonNames[i])")
					}
				}) {
					Image(systemName: "textbox")
				}.padding(10)
				
				// Temporary function that prints out all of the stored button names.
				Button(action: {
					for i in 0...self.userSettings.numOfButtons - 1 {
						print(self.userSettings.buttonNames[i])
					}
					print()
				}) {
					Image(systemName: "textformat.abc")
				}.padding(10)
				
				Divider()
				
				NavigationView {
					Form {
//						if self.userNumOfButtons > 0 {
//							ForEach(0 ..< self.userNumOfButtons) {_ in
//								Section {
//									// $buttonColorIndex is the button identifier (button 1, button 2, button ...)
//									Picker(selection: self.$buttonColorIndex[, label: Text("Button 1")) {
//										LabelTextField()
//
//										ForEach(0 ..< self.colors.count) {
//											Text(self.colors[$0]).tag($0) // tag = key
//										}
//									}
//								}
//							}
//						}
						
						// Hardcoded. Subject to change.
//						else {
							Section {
								Picker(selection: self.$userSettings.colorIndexes[0], label: Text("Button")) {
									LabelTextField()
									
									ForEach(0 ..< colors.count) {
										Text(self.colors[$0]).tag($0)
									}
								}
							}
							Section {
								Picker(selection: self.$userSettings.colorIndexes[1], label: Text("Button 2")) {
									LabelTextField()
									
									ForEach(0 ..< colors.count) {
										Text(self.colors[$0]).tag($0)
									}
								}
							}
							Section {
								Picker(selection: self.$userSettings.colorIndexes[2], label: Text("Button 3")) {
									LabelTextField()
									
									ForEach(0 ..< colors.count) {
										Text(self.colors[$0]).tag($0)
									}
								}
							}
							Section {
								Picker(selection: self.$userSettings.colorIndexes[3], label: Text("Button 4")) {
									LabelTextField()
									
									ForEach(0 ..< colors.count) {
										Text(self.colors[$0]).tag($0)
									}
								}
							}
							Section {
								Picker(selection: self.$userSettings.colorIndexes[4], label: Text("Button 5")) {
									LabelTextField()
									
									ForEach(0 ..< colors.count) {
										Text(self.colors[$0]).tag($0)
									}
								}
							}
							Section {
								Picker(selection: self.$userSettings.colorIndexes[5], label: Text("Button 6")) {
									LabelTextField()
									
									ForEach(0 ..< colors.count) {
										Text(self.colors[$0]).tag($0)
									}
								}
							}
//						}
					}.navigationBarTitle(Text("Button List"))
				}
			}
		}
	}
	
	public func getNumOfButtons() -> Int {
		return self.userNumOfButtons
	}
}

// Back button. Has no purpose right now.
struct buttonView: View {
	var image = ""
	var name = ""
	var body: some View {
		Button(action: {
			
		}) {
			HStack {
				Image(image).renderingMode(.original).resizable().frame(width: 40, height: 40)
				Text(name)
				
				Spacer(minLength: 15)
				
				Image(systemName: "chevron.right")
			}.padding().foregroundColor(Color.black.opacity(0.5))
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
