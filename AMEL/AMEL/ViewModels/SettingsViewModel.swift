//
//  SettingsViewModel.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 4/11/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI
import UIKit

struct SettingsViewModel {
    var savedButtons:FetchedResults<CustomButton>
    var managedObjectContext: NSManagedObjectContext
    private let colorNames = Colors().colorNames
    let maxNumberOfButtons = 14
	func createCustomButton() -> CustomButton {
		return CustomButton(context: managedObjectContext)
	}
	
	func saveCustomButton(newButton:CustomButton, buttonName:String, buttonColor:String, managedObjectContext:NSManagedObjectContext) {
		newButton.buttonName = buttonName
        newButton.index = NSNumber(integerLiteral: self.savedButtons.count)
		newButton.buttonColor = buttonColor
		// update the object
		saveCustomButtons()
	}
	
    func updateButton(name:String, color: Int, button: CustomButton) {
        for sButton in self.savedButtons {
            if sButton == button {
                sButton.buttonName = name
                sButton.buttonColor = self.colorNames[color]
                saveCustomButtons()
            }
        }
    }
	
	func saveCustomButtons(){
        do{
            try managedObjectContext.save()
        }catch{
            print(error)
        }
    }
    
    func deleteAllCustomButtons(){
		self.savedButtons.forEach{(savedButton) in
			managedObjectContext.delete(savedButton)
        }
        saveCustomButtons()
    }
    func getNumberOfButtons()->String {
        if self.savedButtons.count != maxNumberOfButtons {
            return "Number of Buttons: \(self.savedButtons.count)"
        } else {
            return "Number of Buttons: 14 - Maximum"
        }
    }
}
