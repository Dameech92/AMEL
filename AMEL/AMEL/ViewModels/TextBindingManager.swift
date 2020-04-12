//
//  TextBindingManager.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 4/11/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation

class TextBindingManager : ObservableObject {
	private let characterLimit = 14
	
	@Published var text = "" {
		didSet {
			if text.count > self.characterLimit && oldValue.count <= characterLimit {
				text = oldValue
			}
		}
	}
}
