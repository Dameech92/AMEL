//
//  HeadingView.swift
//  AMEL
//
//  Created by Neil Marcellini on 3/3/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI
import CoreLocation

struct HeadingView: View {
    @ObservedObject private var locationManager = LocationManager()
    var body: some View {
        var magHeading = 0.0
        if self.locationManager.heading != nil {
            magHeading = self.locationManager.heading!.magneticHeading
        }
        let truncatedMagHeading = String(format: "%.1f", magHeading)
        return Text("\(truncatedMagHeading)")
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView()
    }
}
