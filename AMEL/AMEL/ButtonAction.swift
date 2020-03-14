//
//  ButtonAction.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 3/2/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import CoreData
import CoreLocation
import SwiftUI

struct ButtonAction {
	// when a button is pressed, record information such as where and when the button was pressed
    public static func record(_ eventName:String, color:UIColor, _ locationManager:LocationManager, _ managedObjectContext:NSManagedObjectContext) {
        let latitude: CLLocationDegrees
        let longitude: CLLocationDegrees
        let altitude: CLLocationDistance
        let magHeading: CLLocationDirection
		if locationManager.location != nil {
            latitude = locationManager.location!.coordinate.latitude
            longitude = locationManager.location!.coordinate.longitude
            altitude = locationManager.location!.altitude
		}
        else{
            latitude = 0.0
            longitude = 0.0
            altitude = 0.0
        }
        
        if locationManager.heading != nil {
            magHeading = locationManager.heading!.magneticHeading
        }
        else {
            magHeading = 0.0
        }
        
        let newEvent = Event(context: managedObjectContext)
        newEvent.name = eventName
        newEvent.latitude = latitude as NSNumber
        newEvent.longitude = longitude as NSNumber
        newEvent.altitude = altitude as NSNumber
        newEvent.magneticHeading = magHeading as NSNumber
        newEvent.time = Date()
        do {
            try newEvent.color = NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false)
        } catch {
            newEvent.color = nil
        }
        
        do {
            try managedObjectContext.save()
        } catch {
            print("Error saving")
        }
	}
}
