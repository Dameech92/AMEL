//
//  LatLngFormatter.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/8/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation

struct LatLngFormatter {
    let latitude: NSNumber
    let longitude: NSNumber
    
    func getLatLng()->String {
        let lat = formatLatitude()
        return ""
    }
    func formatLatitude()->Double {
        return 0.0
    }
    
}
