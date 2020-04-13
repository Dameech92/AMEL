//
//  UserSetting.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 4/12/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation

public class UserSetting: ObservableObject {
	@Published var numOfButtons = 6
	@Published var colorIndexes = [0, 0, 0, 0, 0, 0]
	@Published var buttonNames = UserDefaults.standard.array(forKey: "buttonNames") as? [String] ?? [String]()
	@Published var firstTimeSetupWasPerformed = UserDefaults.standard.bool(forKey: "initialSetup")
//	["Button 1","Button 2","Button 3","Button 4","Button 5","Button 6"]
	
	init() {
		if !self.firstTimeSetupWasPerformed {
			print("not found")
			UserDefaults.standard.set(["Button 1","Button 2","Button 3","Button 4","Button 5","Button 6"], forKey: "buttonNames")
			UserDefaults.standard.set(true, forKey: "initialSetup")
		} else {
			print("found")
		}
	}
}
