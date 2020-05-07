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
    @ObservedObject var errors: SelectorError
    @ObservedObject var activePointSetter: ActivePointSetter
    
    
    func editPoint(point: ReferencePoint) {
        let newLat = convertToDecimalDegrees(data: self.pickerData.latPicker)
        let newLng = convertToDecimalDegrees(data: self.pickerData.lngPicker)
        point.setValue(true, forKey: "isActive")
        point.setValue(newLat, forKey: "latitude")
        point.setValue(newLng, forKey: "longitude")
        point.setValue(self.activePointSetter.selectorData.pointName, forKey: "name")
        save()
    }
    
    func saveNewPoint(name: String) {
        var refPoint = ReferencePoint(context: self.context)
        refPoint = setPointData(refPoint: refPoint, name: name)
        self.activePointSetter.setActivePoint(point: refPoint)
        save()
    }
    
    func setPointData(refPoint: ReferencePoint, name: String)->ReferencePoint{
        refPoint.latitude = convertToDecimalDegrees(data: self.pickerData.latPicker)
        refPoint.longitude = convertToDecimalDegrees(data: self.pickerData.lngPicker)
        refPoint.time = Date()
        refPoint.name = name
        refPoint.isActive = true
        return refPoint
    }
    func save() {
        do {
            try self.context.save()
        } catch {
            print("Error saving refPoint")
        }
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
    
    
    func dataIsValid()->Bool {
        return latInRange(lat: self.activePointSetter.selectorData.latitude) && lngInRange(lng: self.activePointSetter.selectorData.longitude) && nameIsValid(name: self.activePointSetter.selectorData.pointName)
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
    
    func setErrors() {
        self.errors.lat_error = !self.latInRange(lat: self.activePointSetter.selectorData.latitude)
        self.errors.lng_error = !self.lngInRange(lng: self.activePointSetter.selectorData.longitude)
        self.errors.name_error = !self.nameIsValid(name: self.activePointSetter.selectorData.pointName)
    }
    
    func resetFieldOnError() {
        if self.errors.lat_error {
            self.activePointSetter.selectorData.latitude = ""
        }
        if self.errors.lng_error {
            self.activePointSetter.selectorData.longitude = ""
        }
        if self.errors.name_error {
            self.activePointSetter.selectorData.pointName = ""
        }
    }
    
}
