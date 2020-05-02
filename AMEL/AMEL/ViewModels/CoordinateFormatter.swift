//
//  CoordinateFormatter.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/2/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
struct CoordinateFormatter {
    func getLatLng(latitude: Double, longitude: Double)->String {
        let latFormatter = LatFormatter()
        let lngFormatter = LngFormatter()
        return latFormatter.format(latitude: latitude) + " " + lngFormatter.format(longitude: longitude)
    }
}
