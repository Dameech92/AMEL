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
        refPoint.latitude = convertToDecimalDegrees(data: self.pickerData.latPicker)
        refPoint.longitude = convertToDecimalDegrees(data: self.pickerData.lngPicker)
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
    func convertToDecimalDegrees(data: LatLngData)->NSNumber {
        //DD = d + (min/60) + (sec/3600)
       let second = 10 * (data.minute + data.minuteTenth) - data.minute
       let frac1 = Double(data.minute) / 60.0
       let frac2 = Double(second)/3600.0
       let result = Double(data.degree) + frac1 + frac2
       return result as NSNumber
    }
}