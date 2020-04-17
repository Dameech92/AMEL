//
//  BullsEyeAction.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/17/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData
struct ReferencePointAction {
    let pickerData: PickerData
    let context: NSManagedObjectContext
    func recordReferencePoint(name: String) {
        let refPoint = ReferencePoint(context: self.context)
        refPoint.northSouth = pickerData.northSouthIndex as NSNumber
        refPoint.eastWest = pickerData.eastWestIndex as NSNumber
        refPoint.lat = pickerData.latIndex as NSNumber
        refPoint.lng = pickerData.lngIndex as NSNumber
        refPoint.time = Date()
        refPoint.name = name
        saveReferencePoint()
    }
    func saveReferencePoint() {
        do {
            try self.context.save()
        } catch {
            print("Error saving")
        }
    }
}
