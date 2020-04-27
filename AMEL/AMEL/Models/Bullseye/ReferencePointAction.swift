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
        //.d = M.m / 60
        // Decimal Degrees = Degrees + .d
        let dot_m = Double(data.minuteTenth)/10.0
        let dotD = (Double(data.minute) + dot_m) / 60.0
        let result = Double(data.degree) + dotD
        return result as NSNumber
    }
    
    func updateLatitudePicker(latitude: String) {
        let latNum = Double(latitude) ?? 0
        let formatter = LatLngFormatter(latitude: 0, longitude:0)
        let degrees =  formatter.formatLatDegrees(latitude: latNum)
        self.pickerData.latPicker.degree = Int(degrees) ?? 0
        let minutesDotm = formatter.getMinutes_Dot_m(number: latNum)
        let dotIndex = minutesDotm.firstIndex(of: ".")
        let minute = String(minutesDotm.prefix(upTo: dotIndex ?? minutesDotm.endIndex))
        self.pickerData.latPicker.minute = Int(minute) ?? 0
    }
}
