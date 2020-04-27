//
//  LatLngFormatter.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/8/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation

struct LatLngFormatter {
    var latitude: Double
    var longitude: Double
    
    func getLatLng()->String {
        return formatLatitude(latitude: self.latitude) + " " + formatLongitude(longitude: self.longitude)
    }
    func formatLatitude(latitude: Double)->String {
        let minDotm = getMinutes_Dot_m(number: latitude)
        let degrees = formatLatDegrees(latitude: latitude)
        var direction = ""
        if latitude >= 0 {
            direction = "N"
        }else {
            direction = "S"
        }
        return direction + degrees + "-" + minDotm
    }
    func formatLongitude(longitude: Double)->String {
        let minDotm = getMinutes_Dot_m(number: longitude)
        let degrees = formatLngDegrees(longitude: longitude)
        var direction = ""
        if longitude >= 0 {
            direction = "E"
        }else {
            direction = "W"
        }
        return direction + degrees + "-" + minDotm
    }
    
    func getMinutes_Dot_m(number:Double)->String {
        let degrees = abs(Int(number))
        let decimal = abs(number) - Double(degrees)
        let minutes = decimal * 60
        let minutesDotM = String(format: "%04.1f", minutes)
        return minutesDotM
    }
    func formatLatDegrees(latitude: Double)->String {
        let degrees = abs(Int(latitude))
        return String(format: "%02d", degrees)
    }
    func formatLngDegrees(longitude: Double)->String {
        let degrees = abs(Int(longitude))
        return String(format: "%03d", degrees)
    }
    
}
