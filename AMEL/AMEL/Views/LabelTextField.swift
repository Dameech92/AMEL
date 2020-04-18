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
	@EnvironmentObject var userSettings:UserSetting
	private var buttonNameIndex = 0
	@State private var text = ""
	
	@FetchRequest(fetchRequest: CustomButton.getCustomButton()) var customButton:FetchedResults<CustomButton>
	@Environment(\.managedObjectContext) var managedObjectContext
	
	init(_ buttonNameIndex: Int) {
		self.buttonNameIndex = buttonNameIndex
	}
	
	var body: some View {
		let viewModel = SettingsViewModel()
		let buttonList: [CustomButton] = viewModel.getCustomButtons(buttons: customButton, managedObjectContext: self.managedObjectContext)
		
		return VStack(alignment: .leading) {
			Text("Button name")
				.font(.headline)
			TextField("Enter button name", text: self.$text) {
				buttonList[self.buttonNameIndex].buttonName = self.text
				viewModel.saveCustomButtons(managedObjectContext: self.managedObjectContext)
			}
			.padding(.all)
			.background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/25))
		}
		.padding(.horizontal, 15)
	}
}
