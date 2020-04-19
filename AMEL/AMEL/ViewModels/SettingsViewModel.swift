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

class SettingsViewModel: ObservableObject {
	private let colors = [UIColor.red, UIColor.green, UIColor.blue]
	
    @FetchRequest(fetchRequest: CustomButton.getCustomButton()) var savedButtons:FetchedResults<CustomButton>
//    @Environment(\.managedObjectContext) var managedObjectContext

    func getCustomButtons(buttons:FetchedResults<CustomButton>, managedObjectContext:NSManagedObjectContext)->Array<CustomButton> {
		if buttons.count < 1 {
			let newButton = SettingsViewModel.createCustomButton(managedObjectContext: managedObjectContext)
			SettingsViewModel.saveCustomButton(newButton, "New Button", 0, UIColor.gray, managedObjectContext)
		}
		var customButtons: [CustomButton] = []
		buttons.forEach { (buttonData) in
			customButtons.append(buttonData)
		}
		return customButtons
    }
	
	public static func createCustomButton(managedObjectContext:NSManagedObjectContext) -> CustomButton {
		return CustomButton(context: managedObjectContext)
	}
	
	public static func saveCustomButton(_ newButton:CustomButton, _ buttonName:String, _ index:Int, _ buttonColor:UIColor, _ managedObjectContext:NSManagedObjectContext) {
		newButton.buttonName = buttonName
		newButton.index = index as NSNumber
		newButton.buttonColor = buttonColor
		
		// Fetch the event color
//		do {
//            try newButton.buttonColor = NSKeyedArchiver.archivedData(withRootObject: buttonColor, requiringSecureCoding: false)
//        } catch {
//            newButton.buttonColor = nil
//        }
		
		// update the object
		do {
            try managedObjectContext.save()
        } catch {
            print("Error saving")
        }
	}

	func saveCustomButtons(managedObjectContext:NSManagedObjectContext){
        do{
            try managedObjectContext.save()
        }catch{
            print(error)
        }
    }
    
    func deleteAllCustomButtons(managedObjectContext:NSManagedObjectContext){
		self.savedButtons.forEach{(savedButton) in
			managedObjectContext.delete(savedButton)
        }
        saveCustomButtons(managedObjectContext: managedObjectContext)
    }
    
    func deleteCustomButton(eventToDelete: CustomButton, managedObjectContext:NSManagedObjectContext){
		managedObjectContext.delete(eventToDelete)
		saveCustomButtons(managedObjectContext: managedObjectContext)
    }
}
