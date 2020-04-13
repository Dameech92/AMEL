//
//  SettingsView.swift
//  AMEL
//
//  Created by Jeffrey Romero on 4/10/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
	@ObservedObject var settingsViewModel = SettingsViewModel()
	
	@FetchRequest(fetchRequest: UserSetting.getUserSettings()) var userSetting:FetchedResults<UserSetting>
	@Environment(\.managedObjectContext) var managedObjectContext
	
	@State private var newUserSetting = ""
	
	// retrieve stored userNumOfButtons from UserDefaults
	@State private static var userNumOfButtons = UserDefaults.standard.integer(forKey: "numOfButtons")
	
	private let defaultButtonNames:[String] = ["Button 1", "Button 2", "Button 3", "Button 4", "Button 5", "Button 6", "Button 7", "Button 8", "Button 9", "Button 10"]
	private let defaultButtonColorIndex:[Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	
	// Cast the array of type [Any]? to [String] using: "as? [String] ?? [String]()"
	@State private var buttonNames = UserDefaults.standard.array(forKey: "buttonNames") as? [String] ?? [String]()
	
	public var colors = ["Red", "Green", "Blue"]
	@State private var buttonColorIndex = UserDefaults.standard.array(forKey: "buttonColorIndex") as? [Int] ?? [Int]()
	
	@State private var firstTimeSetupWasPerformed = UserDefaults.standard.bool(forKey: "initialSetup")
	
//	let savedArray = UserDefaults.standard.array(forKey:"buttonNames") as? [String] ?? [String]()
	
	init() {
		if !self.firstTimeSetupWasPerformed {
			print("No custom user settings found. Performing first time setup.")

			UserDefaults.standard.set(self.defaultButtonNames, forKey: "buttonNames")
			UserDefaults.standard.set(self.defaultButtonColorIndex, forKey: "buttonColorIndex")
			UserDefaults.standard.set(true, forKey: "initialSetup")
			
//			Toggle(isOn: self.$settingsViewModel.enabled) {
//				Text("asd")
//			}.fixedSize()
		} else {
			print("Custom user settings found.")
		}
	}
	
    var body: some View {
		ZStack {
			Color("stealth").edgesIgnoringSafeArea(.all)
			
			VStack {
				
				// ADD/REMOVE BUTTONS HERE FOR TESTING RIGHT NOW. SUBJECT TO CHANGE.
				Text("Number of buttons: \(SettingsView.self.userNumOfButtons)")
				HStack {
					// adds a new button to the record events page
					Button(action: {
//						SettingsView.self.userNumOfButtons += 1
						UserDefaults.standard.set(SettingsView.self.userNumOfButtons + 1, forKey: "numOfButtons")
						
					}) {
						VStack {
							Text("Add new button")
//							Text("array length: \(self.buttonNames.count)")
							Image(systemName: "plus.square.fill")
						}
					}
					
					Divider()
					
					// removes a button from the record events page
					Button(action: {
						SettingsView.self.userNumOfButtons -= 1
						UserDefaults.standard.set(SettingsView.self.userNumOfButtons, forKey: "numOfButtons")
					}) {
						VStack {
							Text("Remove button")
							Image(systemName: "minus.square.fill")
						}
					}
				}.frame(height:60)
				
				// Temporary function that renames all of the stores button names.
				Button(action: {
					for i in 0...9 {
						print("\(self.buttonNames[i])")
						self.buttonNames[i] = "Button \(i)"
						print("\(self.buttonNames[i])")
					}
					UserDefaults.standard.set(self.buttonNames, forKey: "buttonNames")
				}) {
					Image(systemName: "textbox")
				}
				
				// Temporary function that prints out all of the stored button names.
				Button(action: {
					for i in 0...9 {
						print(self.buttonNames[i])
					}
				}) {
					Image(systemName: "textformat.abc")
				}
				
				Divider()
				
				NavigationView {
					Form {
//						if SettingsView.self.userNumOfButtons > 0 {
//							ForEach(0 ..< SettingsView.self.userNumOfButtons) {_ in
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
								Picker(selection: self.$buttonColorIndex[0], label: Text("Button 1")) {
									LabelTextField()
									
									ForEach(0 ..< colors.count) {
										Text(self.colors[$0]).tag($0)
									}
								}
							}
							Section {
								Picker(selection: $buttonColorIndex[1], label: Text("Button 2")) {
									LabelTextField()
									
									ForEach(0 ..< colors.count) {
										Text(self.colors[$0]).tag($0)
									}
								}
							}
							Section {
								Picker(selection: $buttonColorIndex[2], label: Text("Button 3")) {
									LabelTextField()
									
									ForEach(0 ..< colors.count) {
										Text(self.colors[$0]).tag($0)
									}
								}
							}
							Section {
								Picker(selection: $buttonColorIndex[3], label: Text("Button 4")) {
									LabelTextField()
									
									ForEach(0 ..< colors.count) {
										Text(self.colors[$0]).tag($0)
									}
								}
							}
							Section {
								Picker(selection: $buttonColorIndex[4], label: Text("Button 5")) {
									LabelTextField()
									
									ForEach(0 ..< colors.count) {
										Text(self.colors[$0]).tag($0)
									}
								}
							}
							Section {
								Picker(selection: $buttonColorIndex[5], label: Text("Button 6")) {
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
	
	public static func getNumOfButtons() -> Int {
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
