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
    @FetchRequest(fetchRequest: CustomButton.getCustomButton()) var savedButtons:FetchedResults<CustomButton>
    @Environment(\.managedObjectContext) var managedObjectContext

    func getCustomButtons(buttons:FetchedResults<CustomButton>)->Array<CustomButton>{
            var customButtons: [CustomButton] = []
            savedButtons.forEach { (buttonData) in
                customButtons.append(buttonData)
            }
            return customButtons
    }

    func saveCustomButtons(changedButtons:Array<CustomButton>){
        do{
            try self.managedObjectContext.save()
        }catch{
            print(error)
        }
    }
    
    func deleteAllCustomCuttons(){
        savedButtons.forEach{(savedButton) in
            managedObjectContext.delete(savedButton)
        }
        
        do{
            try self.managedObjectContext.save()
        }catch{
            print(error)
        }
    }
    
    func deleteCustomButton(eventToDelete: CustomButton){
        managedObjectContext.delete(eventToDelete)
        do{
            try self.managedObjectContext.save()
        }catch{
            print(error)
        }
    }
}
