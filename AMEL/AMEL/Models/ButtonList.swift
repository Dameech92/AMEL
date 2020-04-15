//
//  ButtonList.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 4/15/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import CoreData

public class ButtonList: NSObject, NSCoding {
	public var buttonList: [CustomButton] = []
	
	enum Key: String {
		case buttonList = "buttonList"
	}
	
	init(_ buttonList: [CustomButton]) {
		self.buttonList = buttonList
	}
	
	public func encode(with aCoder: NSCoder) {
		aCoder.encode(buttonList, forKey: Key.buttonList.rawValue)
	}
	
	public required convenience init?(coder aDecoder: NSCoder) {
		let fetchedAndDecodedButtonList = aDecoder.decodeObject(forKey: Key.buttonList.rawValue) as! [CustomButton]
		
		// initialize object with the fetched and decoded object from CoreData
		self.init(fetchedAndDecodedButtonList)
	}
}
