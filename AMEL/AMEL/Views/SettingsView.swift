//
//  SettingsView.swift
//  AMEL
//
//  Created by Neil Marcellini on 3/8/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
	@State public var userNumOfButtons = UserDefaults.standard.integer(forKey: "numOfButtons")
	public var colors = ["Red", "Green", "Blue"]
	@State public var buttonColorIndex = [0, 0, 0, 0, 0, 0]
	
    var body: some View {
		ZStack {
			Color("stealth").edgesIgnoringSafeArea(.all)
			
			VStack {
				
				// ADD/REMOVE BUTTONS HERE FOR TESTING RIGHT NOW. SUBJECT TO CHANGE.
				Text("Number of buttons: \(self.userNumOfButtons)")
				HStack {
					// adds a new button to the record events page
					Button(action: {
						self.userNumOfButtons += 1
						UserDefaults.standard.set(self.userNumOfButtons, forKey: "numOfButtons")
					}) {
						VStack {
							Text("Add new button")
							Image(systemName: "plus.square.fill")
						}
					}
					
					Divider()
					
					// removes a button from the record events page
					Button(action: {
						self.userNumOfButtons -= 1
						UserDefaults.standard.set(self.userNumOfButtons, forKey: "numOfButtons")
					}) {
						VStack {
							Text("Remove button")
							Image(systemName: "minus.square.fill")
						}
					}
				}.frame(height:60)
				
				Divider()
				
				NavigationView {
					Form {
						ForEach(0 ..< self.userNumOfButtons) {_ in
							Section {
								// $buttonColorIndex is the button identifier (button 1, button 2, button ...)
								Picker(selection: self.$buttonColorIndex[0], label: Text("Button 1")) {
									ForEach(0 ..< self.colors.count) {
										Text(self.colors[$0]).tag($0) // tag = key
									}
								}
							}
						}
//						Section {
//							// $buttonColorIndex is the button identifier (button 1, button 2, button ...)
//							Picker(selection: $buttonColorIndex[0], label: Text("Button 1")) {
//								ForEach(0 ..< colors.count) {
//									Text(self.colors[$0]).tag($0) // tag = key
//								}
//							}
//						}
//						Section {
//							Picker(selection: $buttonColorIndex[1], label: Text("Button 2")) {
//								ForEach(0 ..< colors.count) {
//									Text(self.colors[$0]).tag($0)
//								}
//							}
//						}
//						Section {
//							Picker(selection: $buttonColorIndex[2], label: Text("Button 3")) {
//								ForEach(0 ..< colors.count) {
//									Text(self.colors[$0]).tag($0)
//								}
//							}
//						}
//						Section {
//							Picker(selection: $buttonColorIndex[3], label: Text("Button 4")) {
//								ForEach(0 ..< colors.count) {
//									Text(self.colors[$0]).tag($0)
//								}
//							}
//						}
//						Section {
//							Picker(selection: $buttonColorIndex[4], label: Text("Button 5")) {
//								ForEach(0 ..< colors.count) {
//									Text(self.colors[$0]).tag($0)
//								}
//							}
//						}
//						Section {
//							Picker(selection: $buttonColorIndex[5], label: Text("Button 6")) {
//								ForEach(0 ..< colors.count) {
//									Text(self.colors[$0]).tag($0)
//								}
//							}
//						}
					}.navigationBarTitle(Text("Button List"))
				}
			}
		}
	}
}

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

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
