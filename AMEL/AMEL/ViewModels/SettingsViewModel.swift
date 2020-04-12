//
//  SettingsViewModel.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 4/11/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation

class SettingsViewModel: ObservableObject {
	@Published var enabled:Bool = UserDefaults.standard.bool(forKey: "enabled") {
		didSet {
			UserDefaults.standard.set(self.enabled, forKey: "enabled")
		}
	}
}
