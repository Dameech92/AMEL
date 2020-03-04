//
//  LocationView.swift
//  logLocation
//
//  Created by Dimitri Cognata on 3/2/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

import SwiftUI
import CoreLocation
struct LocationView: View {
    @ObservedObject private var locationManager = LocationManager()
    var body: some View {
        let coordinate = self.locationManager.location != nil ?
          self.locationManager.location!.coordinate : CLLocationCoordinate2D()
        let truncatedLatitude = String(format: "%.4f", coordinate.latitude)
        let truncatedLongitude = String(format: "%.4f", coordinate.longitude)
        let altitude = self.locationManager.location != nil ? self.locationManager.location!.altitude : CLLocationDistance()
        let truncatedAltitude = String(format: "%.2f", altitude)
        
        return Text("\(truncatedLatitude)/\( truncatedLongitude )/\(truncatedAltitude)")
        
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
