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
    @ObservedObject var activePointSetter: ActivePointSetter

    func recordReferencePoint(name: String) {
        let refPoint = ReferencePoint(context: self.context)
        refPoint.latitude = convertToDecimalDegrees(data: self.pickerData.latPicker)
        refPoint.longitude = convertToDecimalDegrees(data: self.pickerData.lngPicker)
        refPoint.time = Date()
        refPoint.name = name
        refPoint.isActive = true
        self.activePointSetter.setActivePoint(point: refPoint)
    }
    
    
    func convertToDecimalDegrees(data: LatLngData)->NSNumber {
        //.d = M.m / 60
        // Decimal Degrees = Degrees + .d
        let dot_m = Double(data.minuteTenth)/10.0
        let dotD = (Double(data.minute) + dot_m) / 60.0
        var result = Double(data.degree) + dotD
        if data.direction == 1 {
            result = result * -1
        }
        return result as NSNumber
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
