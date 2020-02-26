//
//  EventView.swift
//  logLocation
//
//  Created by Neil Marcellini on 2/25/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct EventView: View {
    var name: String?
    var time: Date?
    var latitude: Double = 0
    var longitude: Double = 0
    var altitude: Double = 0
    
    var body: some View {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateTimeString = dateFormatterGet.string(from: time!)
        let truncatedLatitude = String(format: "%.4f", latitude)
        let truncatedLongitude = String(format: "%.4f", longitude)
        let truncatedAltitude = String(format: "%.1f", altitude)
        return HStack {
            Text(name!)
            Text(dateTimeString)
            Text("Lat/lng/alt: \(truncatedLatitude)/\(truncatedLongitude)/\(truncatedAltitude)")
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        let date = Date()
        return EventView(name: "Missile", time: date, latitude: 34.3, longitude: 37.1, altitude: 10)
    }
}
