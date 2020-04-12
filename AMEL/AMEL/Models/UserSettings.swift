//
//  UserSettings.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 4/10/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import SwiftUI

struct UserSettings {
	@State public var userNumOfButtons = UserDefaults.standard.integer(forKey: "numOfButtons")
	public static var colors = ["Red", "Green", "Blue"]
	@State public var buttonColorIndex = [0, 0, 0, 0, 0, 0]
}
