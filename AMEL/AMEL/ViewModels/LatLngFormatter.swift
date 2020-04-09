//
//  LatLngFormatter.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/8/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation

struct LatLngFormatter {
    let latitude: Double
    let longitude: Double
    
    func getLatLng()->String {
        return formatLatitude(latitude: self.latitude) + " " + formatLongitude(longitude: self.longitude)
    }
    func formatLatitude(latitude: Double)->String {
        let number = getDMS(number: latitude)
        var direction = ""
        if latitude > 0 {
            direction = "N"
        }else {
            direction = "S"
        }
        return direction + number
    }
    func formatLongitude(longitude: Double)->String {
        let number = getDMS(number: longitude)
        var direction = ""
        if longitude > 0 {
            direction = "E"
        }else {
            direction = "W"
        }
        return direction + number
    }
    func getDMS(number:Double)->String {
        let degrees = abs(Int(number))
        let decimal = abs(number) - Double(degrees)
        let minutes = decimal * 60
        let minutesDotM = String(format: "%.1f", minutes)
        return String(degrees) + "-" + minutesDotM
    }
    
}
