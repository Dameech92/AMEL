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
    @FetchRequest(fetchRequest: CustomButton.getCustomButton()) var buttons:FetchedResults<CustomButton>

    func getCustomButtons(buttons:FetchedResults<CustomButton>)->Array<CustomButton>{
            var customButtons: [CustomButton] = []
            buttons.forEach { (buttonData) in
                customButtons.append(buttonData)
            }
        
            return customButtons
    }

    func saveCustomButtons(buttons:Array<CustomButton>){
    
    }
}
