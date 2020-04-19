//
//  LocationManager.swift
//  logLocation
//
//  Created by Neil Marcellini on 2/25/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation? = nil
    @Published var heading: CLHeading? = nil
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.locationManager.startUpdatingHeading()
    }
}
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        self.location = location
    }
    // default updates on 1 degree or greater change
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading){
        self.heading = newHeading
    }
}
