//
//  CustomButton.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 4/14/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData

class CustomButton: NSObject, NSCoding {
	var buttonName:String
	var buttonColor:UIColor
	
	override init() {
		self.buttonName = "defaultButtonName"
		self.buttonColor = UIColor.blue
	}
	
	init(_ buttonName:String, _ buttonColor:UIColor) {
		self.buttonName = buttonName
		self.buttonColor = buttonColor
	}
	
	required convenience init(coder aDecoder: NSCoder) {
		let buttonName = aDecoder.decodeObject(forKey: "name") as! String
		let buttonColor = aDecoder.decodeObject(forKey: "color") as! UIColor
		self.init(buttonName, buttonColor)
	}
	
	func encode (with aCoder: NSCoder) {
		aCoder.encode(buttonName, forKey: "name")
		aCoder.encode(buttonColor, forKey: "color")
	}
	
	public func getButtonName() -> String {
		return self.buttonName
	}
	
	public func getButtonColor() -> UIColor {
		return self.buttonColor
	}
	
	public func setButtonName(_ newButtonName:String) {
		self.buttonName = newButtonName
	}
	
	public func setButtonColor(_ newButtonColor:UIColor) {
		self.buttonColor = newButtonColor
	}
}
