//
//  LatLngFormatter.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/2/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
class LatLngFormatter {    
    func getMinutes_Dot_m(number:Double)->String {
        let degrees = abs(Int(number))
        let decimal = abs(number) - Double(degrees)
        let minutes = decimal * 60
        let minutesDotM = String(format: "%04.1f", minutes)
        return minutesDotM
    }
    func getDir(lat_lng: Double)->String {
        return ""
    }
    
    func formatDegrees(latlng: Double)->String{
        return ""
    }
}
