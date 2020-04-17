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
        refPoint.lat = convertToDecimalDegrees(data: self.pickerData.latPicker)
        refPoint.lng = convertToDecimalDegrees(data: self.pickerData.lngPicker)
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
        var decimals = Double(data.degree) + ((Double(data.minute) + Double(data.minuteTenth))/60.0)
        if data.direction == 1 {
            decimals = decimals * -1
        }
        return decimals as NSNumber
    }
}
