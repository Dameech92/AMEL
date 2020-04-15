//
//  UserSetting.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 4/12/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

private var cancellables = [String:AnyCancellable]()

extension Published {
	init(wrappedValue defaultValue: Value, key: String) {
		let value = UserDefaults.standard.object(forKey: key) as? Value ?? defaultValue
		self.init(initialValue: value)
		cancellables[key] = projectedValue.sink { val in
			UserDefaults.standard.set(val, forKey: key)
		}
	}
}

public class UserSetting: ObservableObject {
	private let maxLengthOfButtonName = 17
	@Published var numOfButtons = 6
	@Published var colorIndexes = [0, 0, 0, 0, 0, 0]
//	{
//		didSet {
//			UserDefaults.standard.array(forKey: "colorIndexes")
//			UserDefaults.standard.set(self.colorIndexes, forKey: "colorIndexes")
//		}
//	}
	@Published var colors = ["Red", "Green", "Blue"]
	@Published var selectedButton = 0

	@Published(key: "buttonNames") var buttonNames = [CustomButton("Button 1", UIColor.blue),
													  CustomButton("Button 2", UIColor.blue),
													  CustomButton("Button 3", UIColor.blue),
													  CustomButton("Button 4", UIColor.blue),
													  CustomButton("Button 5", UIColor.blue),
													  CustomButton("Button 6", UIColor.blue)]
	let encodedData:Data = NSKeyedArchiver.archivedData(withRootObject: buttonNames)
//	{
//		didSet {
//			// check if the button name has too many characters
//			if buttonNames[0] > maxLengthOfButtonName && oldValue[0].count <= maxLengthOfButtonName {
//				buttonNames[0] = oldValue[0]
//			}
//		}
//	}
}
