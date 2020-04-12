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
    
    func getLatLng()->String {
        if self.locationManager.location != nil {
            let locFormatter = LatLngFormatter(latitude: self.locationManager.location!.coordinate.latitude, longitude: self.locationManager.location!.coordinate.longitude)
            return locFormatter.getLatLng()
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
    func getAltitude()->(String){
        if self.locationManager.location != nil {
            return String(format: "%.4f", locationManager.location!.altitude)
        }
        else{
            return "0.0"
        }
    }
    func getSpeed()->String {
        if self.locationManager.location != nil {
            return String(format: "%.4f", locationManager.location!.speed)
        }
        else{
            return "0.0"
        }
    }
    
    func getSpeedAccuracy()->String {
        if self.locationManager.location != nil {
            return String(format: "%.4f", locationManager.location!.speedAccuracy)
        }
        else{
            return "0.0"
        }
    }
        
}
