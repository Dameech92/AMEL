//
//  LngFormatter.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/2/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
class LngFormatter: LatLngFormatter {
    func formatLongitude(longitude: Double)->String {
        super.format(latitude: longitude)
    }
    override func getDir(lat_lng: Double)->String {
        if lat_lng >= 0 {
            return "E"
        }
        else {
            return "W"
        }
    }
    override func formatDegrees(latlng: Double)->String {
        let degrees = abs(Int(latlng))
        return String(format: "%03d", degrees)
    }
}
