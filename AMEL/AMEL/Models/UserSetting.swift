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
import CoreData

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
	@Published var colors = ["Red", "Green", "Blue"]
	@Published var selectedButton = 0

	@Published(key: "buttonNames") var buttonNames = ["Button 1", "Button 2", "Button 3", "Button 4", "Button 5", "Button 6"]
}
