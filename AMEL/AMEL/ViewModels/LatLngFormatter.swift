//
//  LatLngFormatter.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/8/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation

class LatLngFormatter {
    func format(latitude: Double)->String {
        let minDotm = getMinutes_Dot_m(number: latitude)
        let degrees = formatDegrees(latlng: latitude)
        let direction = getDir(lat_lng: latitude)
        return direction + degrees + "-" + minDotm
    }
    func formatDegrees(latlng:Double)->String{
        let degrees = abs(Int(latlng))
        return String(format: "%d", degrees)
    }
    
    func getDir(lat_lng: Double)->String {
        return ""
    }
    
    func getMinutes_Dot_m(number:Double)->String {
        let degrees = abs(Int(number))
        let decimal = abs(number) - Double(degrees)
        let minutes = decimal * 60
        let minutesDotM = String(format: "%04.1f", minutes)
        return minutesDotM
    }
}
