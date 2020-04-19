//
//  ButtonSaver.swift
//  AMEL
//
//  Created by Dimitri Cognata on 4/18/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData
struct ButtonSaver {
    let settingsData: SettingsData
    let context: NSManagedObjectContext
    let colorChoices = [Color.red, Color.blue, Color.green]
    func saveButtonData() {
        let button = ButtonData()
        button.color = saveColor()
        button.time = Date()
        button.name = self.settingsData.name
        saveButton()
    }
    func saveButton() {
        do {
            try self.context.save()
        } catch {
            print("Error saving")
        }
    }
    func saveColor()->Data? {
        let colorData: Data?
        do {
            try colorData = NSKeyedArchiver.archivedData(withRootObject: self.colorChoices[self.settingsData.color], requiringSecureCoding: false)
        } catch {
            colorData = nil
        }
        return colorData
    }
}
