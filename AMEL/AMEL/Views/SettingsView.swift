//
//  SettingsView.swift
//  AMEL
//
//  Created by Neil Marcellini on 3/8/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
	@State private var userNumOfButtons = UserDefaults.standard.integer(forKey: "numOfButtons")
	@State private var colorIndex = 0 // the index of the currently picked color
	private var colors = ["Red", "Green", "Blue"]
	@State private var buttonColorIndex = [0, 0, 0, 0, 0, 0]
	
    var body: some View {
//		VStack {
			ZStack {
				Color("stealth").edgesIgnoringSafeArea(.all)
				
				VStack {
					Button(action: {
						self.userNumOfButtons += 1
						UserDefaults.standard.set(self.userNumOfButtons, forKey: "numOfButtons")
					}) {
						VStack {
							Text("Add new button/Num of buttons: \(userNumOfButtons)")
							Image(systemName: "plus.square.fill")
						}
					}
					
					Divider()
					
					NavigationView {
						Form {
							Section {
								Picker(selection: $buttonColorIndex[0], label: Text("Button 1")) {
									ForEach(0 ..< colors.count) {
										Text(self.colors[$0]).tag($0) // tag = key
									}
								}
							}
							Section {
								Picker(selection: $buttonColorIndex[1], label: Text("Button 2")) {
									ForEach(0 ..< colors.count) {
										Text(self.colors[$0]).tag($0) // tag = key
									}
								}
							}
							Section {
								Picker(selection: $buttonColorIndex[2], label: Text("Button 3")) {
									ForEach(0 ..< colors.count) {
										Text(self.colors[$0]).tag($0) // tag = key
									}
								}
							}
							Section {
								Picker(selection: $buttonColorIndex[3], label: Text("Button 4")) {
									ForEach(0 ..< colors.count) {
										Text(self.colors[$0]).tag($0) // tag = key
									}
								}
							}
							Section {
								Picker(selection: $buttonColorIndex[4], label: Text("Button 5")) {
									ForEach(0 ..< colors.count) {
										Text(self.colors[$0]).tag($0) // tag = key
									}
								}
							}
							Section {
								Picker(selection: $buttonColorIndex[5], label: Text("Button 6")) {
									ForEach(0 ..< colors.count) {
										Text(self.colors[$0]).tag($0) // tag = key
									}
								}
							}
						}.navigationBarTitle(Text("Button List"))
					}
				}
				
				
//				Image("stealth").resizable().frame(height: 150)
//				Color("buttonBackGround").edgesIgnoringSafeArea(.all)
//				List {
//					Section(header: Text("Buttons")) {
//						ForEach((0..<(userNumOfButtons)), id: \.self) {
//
//						}
//					}
//				} .background(Color.white)
				
//				HStack {
//					VStack(alignment: .leading, spacing: 45, content: {
//						Button(action: {
//
//						}) {
//							Image("chevron.left").font(.title)
//						}
//
//						Text("Settings").font(.title)
//					}).foregroundColor(Color.black.opacity(0.5))
//
//					Spacer()
//				}.padding()
//					.padding(.top, 10)
//
//				VStack {
//					Image("name").overlay(Text("K").foregroundColor(.white).font(.title))
//
//					Spacer()
//				}.padding(.top, 30)
				
			}
			
//			Spacer()
//		}.background(Color.white)
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
