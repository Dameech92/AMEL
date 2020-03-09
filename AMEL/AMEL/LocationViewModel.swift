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
        
}
