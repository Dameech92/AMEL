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
//	lazy var encodedData:Data = NSKeyedArchiver.archivedData(withRootObject: buttonNames)
//	UserDefaults.standard.set(encodedData, forKey: "buttonNames")
//
//	let decoded = UserDefaults.standard.data(forKey: "buttonNames")
//	let decodedButtons = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [CustomButton]
	
	
	func createData() {
		// create reference to the container within AppDelegate
		guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
		
		// create context from container
		let managedContext = appDelegate.persistentContainer.viewContext
		
		// create an entity and new button list
		let userEntity = NSEntityDescription.entity(forEntityName: "UserButtons", in: managedContext)!
		
		var buttonListArray: [CustomButton] = []
		
		for i in 0...5 {
			let newButton = CustomButton("Button \(i + 1)", UIColor.blue)
			buttonListArray.append(newButton)
		}
		
		let buttonList = NSManagedObject(entity: userEntity, insertInto: managedContext) as! UserButtons
		let newButtonList = ButtonList(buttonListArray)
		buttonList.setValue(newButtonList, forKeyPath: "buttonList")
		
		buttonList.highlighted = 
	}
}
