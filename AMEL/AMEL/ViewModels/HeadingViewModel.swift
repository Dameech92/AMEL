//
//  HeadingView.swift
//  AMEL
//
//  Created by Neil Marcellini on 3/3/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI
import CoreLocation

struct HeadingViewModel {
    @ObservedObject private var locationManager = LocationManager()
    init() {
    }
    func getMagHeading() -> String {
        let heading = self.locationManager.heading
        if heading != nil {
           return String(format: "%.1f", heading!.magneticHeading)
        } else {
            return "0.0"
        }
    }
    func getCourse()->String {
        var formattedCourse = "Course: ---°"
        if self.locationManager.location != nil {
            let course = self.locationManager.location!.course
            if courseIsAccurate(course: course) {
                formattedCourse = "Course: " + String(format: "%03d", Int(course)) + "°"
            }
        }
        return formattedCourse
    }
    func courseIsAccurate(course: CLLocationDirection)->Bool {
        return course >= 0
    }
    
}
   
