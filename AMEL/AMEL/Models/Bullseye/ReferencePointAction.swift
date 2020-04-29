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
        resetPickers()
    }
    func saveReferencePoint() {
        do {
            try self.context.save()
        } catch {
            print("Error saving")
        }
    }
    func resetPickers() {
        self.pickerData.latPicker.degree = 0
        self.pickerData.latPicker.direction = 0
        self.pickerData.latPicker.minute = 0
        self.pickerData.latPicker.minuteTenth = 0
        self.pickerData.lngPicker.degree = 0
        self.pickerData.lngPicker.direction = 0
        self.pickerData.lngPicker.minute = 0
        self.pickerData.lngPicker.minuteTenth = 0
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
        if updateNeeded(input: latitude) {
            let latNum = Double(latitude) ?? 0
            let formatter = LatLngFormatter(latitude: 0, longitude:0)
            let direction = formatter.getDirLatitude(lat: latNum)
            self.pickerData.latPicker.direction = directionToInt(direction: direction)
            let degrees =  formatter.formatLatDegrees(latitude: latNum)
            self.pickerData.latPicker.degree = Int(degrees) ?? 0
            let minutesDotm = formatter.getMinutes_Dot_m(number: latNum)
            let dotIndex = minutesDotm.firstIndex(of: ".")
            let minute = String(minutesDotm.prefix(upTo: dotIndex ?? minutesDotm.endIndex))
            self.pickerData.latPicker.minute = Int(minute) ?? 0
            let afterDot = minutesDotm.index(after: dotIndex ?? minutesDotm.startIndex)
            let minTenth = String(minutesDotm.suffix(from: afterDot))
            self.pickerData.latPicker.minuteTenth = Int(minTenth) ?? 0
        }
    }
    func updateLongitudePicker(longitude: String) {
        if updateNeeded(input: longitude) {
            let lngNum = Double(longitude) ?? 0
            let formatter = LatLngFormatter(latitude: 0, longitude:0)
            let direction = formatter.getDirLongitude(lng: lngNum)
            self.pickerData.lngPicker.direction = directionToInt(direction: direction)
            let degrees = formatter.formatLngDegrees(longitude: lngNum)
            self.pickerData.lngPicker.degree = Int(degrees) ?? 0
            let minutesDotm = formatter.getMinutes_Dot_m(number: lngNum)
            let dotIndex = minutesDotm.firstIndex(of: ".")
            let minute = String(minutesDotm.prefix(upTo: dotIndex ?? minutesDotm.endIndex))
            self.pickerData.lngPicker.minute = Int(minute) ?? 0
            let afterDot = minutesDotm.index(after: dotIndex ?? minutesDotm.startIndex)
            let minTenth = String(minutesDotm.suffix(from: afterDot))
            self.pickerData.lngPicker.minuteTenth = Int(minTenth) ?? 0
        }
        
    }
    func updateNeeded(input: String)->Bool {
        return input != ""
    }
    
    
    func directionToInt(direction: String)->Int {
        if direction == "N" || direction == "E" {
            return 0
        }
        else {
            return 1
        }
    }
    
    func dataIsValid(lat: String, lng: String, name: String)->Bool {
        return latInRange(lat: lat) && lngInRange(lng: lng) && nameIsValid(name: name)
        
    }
    func nameIsValid(name: String)->Bool {
        return name != ""
    }
    
    func latInRange(lat: String)->Bool {
        var result = false
        let latitude = Double(lat)
        if latitude != nil {
            if abs(latitude!) <= 90{
                result = true
            }
        }
        else if lat == "" {
            result = true
        }
        return result
    }
    
    func lngInRange(lng:String)->Bool {
        var result = false
       let longitude = Double(lng)
        if longitude != nil {
            if abs(longitude!) <= 180 {
                result = true
            }
        }
        else if lng == "" {
            result = true
        }
        return result
    }
    
}
