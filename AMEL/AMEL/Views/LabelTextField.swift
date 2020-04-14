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
	@State public var buttonNameIndex = 0
	
	init(_ buttonNameIndex: Int) {
		self.buttonNameIndex = buttonNameIndex
	}
	
	var body: some View {
		VStack(alignment: .leading) {
			Text("Button name")
				.font(.headline)
			TextField("Enter button name", text: self.$userSettings.buttonNames[self.buttonNameIndex])
			.padding(.all)
			.background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/25))
		}
		.padding(.horizontal, 15)
	}
}
