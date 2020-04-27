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
    
    func updatePicker(lat: String, lng: String) {
        let latitude = Double(lat) ?? 0
        let longitude = Double(lng) ?? 0
        let formatter = LatLngFormatter(latitude: latitude, longitude: longitude)
        let valString =  formatter.getDM(number: latitude)
        let startIndex = valString.index(valString.startIndex, offsetBy: 1)
        let endIndex = valString.index(startIndex, offsetBy: 2)
        let degreeString = valString[startIndex..<endIndex]
        self.pickerData.latPicker.degree = Int(String(degreeString)) ?? 0
    }
}
