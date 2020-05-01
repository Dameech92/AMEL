//
//  PickerFormatter.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/17/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation

struct RefPointViewModel {
    let point : ReferencePoint
    
    func getLatLng()->String {
        if (point.latitude != nil && point.longitude != nil){
            let latitude = Double(truncating: point.latitude!)
            let longitude = Double(truncating: point.longitude!)
            let formatter = LatLngFormatter(latitude: latitude, longitude: longitude)
            return formatter.getLatLng()
        }else{
            return "0"
        }
    }
    func getName()->String {
        if point.name != nil {
            return point.name!
        }
        return "unnamed"
    }
}
