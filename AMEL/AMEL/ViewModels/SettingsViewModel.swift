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
    var savedButtons: FetchedResults<CustomButton>
    private let colorNames = Colors().colorNames
	func createCustomButton(managedObjectContext:NSManagedObjectContext) -> CustomButton {
		return CustomButton(context: managedObjectContext)
	}
	
	func saveCustomButton(newButton:CustomButton, buttonName:String, buttonColor:String, managedObjectContext:NSManagedObjectContext) {
		newButton.buttonName = buttonName
        newButton.index = (self.savedButtons.count + 1) as NSNumber
		newButton.buttonColor = buttonColor
		// update the object
		saveCustomButtons(managedObjectContext: managedObjectContext)
	}
	
    func updateButton(name:String, color: Int, button: CustomButton, context: NSManagedObjectContext) {
        for sButton in self.savedButtons {
            if sButton == button {
                sButton.buttonName = name
                sButton.buttonColor = self.colorNames[color]
                saveCustomButtons(managedObjectContext: context)
            }
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

struct SettingsViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
