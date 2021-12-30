//
//  LatFormatter.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/2/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation

class LatFormatter: LatLngFormatter {
    func format(latitude: Double)->String {
        let minDotm = getMinutes_Dot_m(number: latitude)
        let degrees = formatDegrees(latlng: latitude)
        let direction = getDir(lat_lng: latitude)
        return direction + degrees + " " + minDotm
    }
    override func getDir(lat_lng: Double)->String {
        if lat_lng >= 0 {
            return "N"
        }
        else {
            return "S"
        }
    }
    override func formatDegrees(latlng: Double)->String {
        let degrees = abs(Int(latlng))
        return String(format: "%02d", degrees)
    }
}
