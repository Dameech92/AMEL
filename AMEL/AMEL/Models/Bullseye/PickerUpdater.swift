//
//  PickerUpdater.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/2/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
struct PickerUpdater {
    let formatter: LatLngFormatter
    let latlngData: LatLngData
    
    func updateNeeded(input: String)->Bool {
        return input != ""
    }
    func updatePicker(latOrLng: String) {
        if updateNeeded(input: latOrLng) {
            let lat_lngNum = Double(latOrLng) ?? 0
            let direction = self.formatter.getDir(lat_lng: lat_lngNum)
            self.latlngData.direction = directionToInt(direction: direction)
            let degrees =  self.formatter.formatDegrees(latlng: lat_lngNum)
            self.latlngData.degree = Int(degrees) ?? 0
            let minutesDotm = self.formatter.getMinutes_Dot_m(number: lat_lngNum)
            let dotIndex = minutesDotm.firstIndex(of: ".")
            let minute = String(minutesDotm.prefix(upTo: dotIndex ?? minutesDotm.endIndex))
            self.latlngData.minute = Int(minute) ?? 0
            let afterDot = minutesDotm.index(after: dotIndex ?? minutesDotm.startIndex)
            let minTenth = String(minutesDotm.suffix(from: afterDot))
            self.latlngData.minuteTenth = Int(minTenth) ?? 0
        } else {
            self.latlngData.degree = 0
            self.latlngData.minute = 0
            self.latlngData.minuteTenth = 0
        }
    }
    func directionToInt(direction: String)->Int {
        if direction == "N" || direction == "E" {
            return 0
        }
        else {
            return 1
        }
    }
}
