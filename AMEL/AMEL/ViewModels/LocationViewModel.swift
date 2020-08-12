//
//  LocationViewModel.swift
//
//
//  Created by Dimitri Cognata on 3/2/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI
import CoreLocation
struct LocationViewModel {
    @ObservedObject private var locationManager = LocationManager()
    init() {
    }
    
    func getLatRaw()->Double{
        if self.locationManager.location != nil{
            return (locationManager.location?.coordinate.latitude)! as Double
        }else {return 0.0}
    }
    
    func getLongRaw()->Double{
        if self.locationManager.location != nil{
            return (locationManager.location?.coordinate.longitude)! as Double
        }else {return 0.0}
    }
    
    func getLatLng()->String {
        if self.locationManager.location != nil {
            let locFormatter = CoordinateFormatter()
            return locFormatter.getLatLng(latitude: self.locationManager.location!.coordinate.latitude, longitude: self.locationManager.location!.coordinate.longitude)
        }
       else{
           return "0.0"
       }
        
    }
    func getLatitude()->(String){
        if self.locationManager.location != nil {
            return String(format: "%.4f", locationManager.location!.coordinate.latitude)
        }
        else{
            return "0.0"
        }
    }
    func getLongitude()->(String){
        if self.locationManager.location != nil {
            return String(format: "%.4f", locationManager.location!.coordinate.longitude)
        }
        else{
            return "0.0"
        }
    }
    func getGroundSpeed()->String {
        var groundSpeed = "Groundspeed: unavailable"
        if self.locationManager.location != nil{
            let speed = speedToNM(speedMPS: locationManager.location!.speed)
            // set speed only if it is accurate, i.e positive
            if speed >= 0 {
                groundSpeed = "Groundspeed: " + String(format: "%d", Int(speed)) + " nm/hr"
            }
        }
        return groundSpeed
    }
    private func speedToNM(speedMPS: CLLocationSpeed)->Double {
        return speedMPS * 1.94384449412
    }
    
    func getSpeedAccuracy()->String {
        if self.locationManager.location != nil {
            return String(format: "%.4f", locationManager.location!.speedAccuracy)
        }
        else{
            return "0.0"
        }
    }
    func getAltitude()->String{
        if(locationManager.location != nil){
            let altitude =  String(format: "%d", Int(altToFeet(altMeters: locationManager.location!.altitude)))
            return "Altitude: " + altitude + "ft MSL"
        }else{
            return "Altitude: unavailable"
        }
    }
    private func altToFeet(altMeters: CLLocationDistance)->Double {
        return altMeters * 3.2808
    }
    
    func getLocationAccuracy() -> String {
        var display = ""
        if (locationManager.location != nil) {
            let locationAccuracy = metersToFeet(meters: locationManager.location!.horizontalAccuracy)
            display = "Location Accuracy: " +  String(format: "%.2f", locationAccuracy) + " ft"
        }
        return display
    }
    func metersToFeet(meters: Double)-> Double{
        return meters * 3.28084
    }
    
        
}
