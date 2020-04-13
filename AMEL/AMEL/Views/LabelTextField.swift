//
//  LabelTextField.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 4/11/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import SwiftUI

struct LabelTextField: View {
//	@State var buttonName = "Button"
	@ObservedObject var textBindingManager = TextBindingManager()
	@EnvironmentObject var userSettings:UserSetting
	
	var body: some View {
		VStack(alignment: .leading) {
			Text("Button name")
				.font(.headline)
			TextField("Enter button name", text: self.$textBindingManager.text, onEditingChanged: {_ in
//				print("\(self.userSettings.buttonNames[0]), \(self.textBindingManager.text)")
				self.userSettings.buttonNames[0] = self.textBindingManager.text
//				print("\(self.userSettings.buttonNames[0]), \(self.textBindingManager.text)")
				UserDefaults.standard.set(self.$textBindingManager.text, forKey: "buttonNames")
			})
//			{
//				print("\(self.userSettings.name)")
//				self.userSettings.name = self.textBindingManager.text
//				print("\(self.userSettings.name)")
//				print("\(self.userSettings.buttonNames[0]), \(self.textBindingManager.text)")
//				self.userSettings.buttonNames[0] = self.textBindingManager.text
//				print("\(self.userSettings.buttonNames[0]), \(self.textBindingManager.text)")
//			}
			.padding(.all)
			.background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/25))
		}
		.padding(.horizontal, 15)
	}
}
