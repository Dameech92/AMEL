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

struct CustomButton {
	private var buttonName:String?
	private var buttonColor:UIColor?
	
	init() {
		self.buttonName = "defaultButtonName"
		self.buttonColor = UIColor.blue
	}
	
	init(_ buttonName:String, _ buttonColor:UIColor) {
		self.buttonName = buttonName
		self.buttonColor = buttonColor
	}
	
	public func getButtonName() -> String {
		return self.buttonName!
	}
	
	public func getButtonColor() -> UIColor {
		return self.buttonColor!
	}
	
	public mutating func changeButtonName(_ newButtonName:String) {
		self.buttonName = newButtonName
	}
	
	public mutating func changeButtonColor(_ newButtonColor:UIColor) {
		self.buttonColor = newButtonColor
	}
}

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
	@Published(key: "buttonNames") var buttonNames = ["Button 1", "Button 2", "Button 3", "Button 4", "Button 5", "Button 6"] {
		didSet {
			// check if the button name has too many characters
			if buttonNames[0].count > maxLengthOfButtonName && oldValue[0].count <= maxLengthOfButtonName {
				buttonNames[0] = oldValue[0]
			}
		}
	}
}
