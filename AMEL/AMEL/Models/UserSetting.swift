//
//  UserSetting.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 4/12/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation

public class UserSetting: ObservableObject {
//	private let characterLimit = 14
	@Published var numOfButtons = 6
	@Published var colorIndexes = [0, 0, 0, 0, 0, 0]
	@Published var buttonNames = ["Button 1","Button 2","Button 3","Button 4","Button 5","Button 6"]
}
