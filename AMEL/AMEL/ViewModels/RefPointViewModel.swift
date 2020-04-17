//
//  PickerFormatter.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/17/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation

struct RefPointViewModel {
    let point: ReferencePoint
    func getNorthSouth()->String {
        if point.northSouth == 0 {
            return "N"
        }
        else {
            return "S"
        }
    }
    func getEastWest()->String {
        if point.eastWest == 0 {
            return "E"
        }
        else {
            return "W"
        }
    }
    func getLatitude()->String {
        if point.lng != nil {
            return String(format: "%02d", Int(truncating: point.lat!))
        }
        return "--"
    }
    func getLongitude()->String {
        if point.lat != nil {
            return String(format: "%02d", Int(truncating: point.lng!))
        }
        return "---"
    }
    func getName()->String {
        if point.name != nil {
            return point.name!
        }
        return "unnamed"
    }
}
