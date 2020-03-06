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

struct ButtonAction {
	// when a button is pressed, record information such as where and when the button was pressed
	public static func record(_ eventName:String, _ locationManager:LocationManager, _ managedObjectContext:NSManagedObjectContext) {
		var coordinate:CLLocationCoordinate2D
		var altitude:CLLocationDistance
        var magHeading:CLLocationDirection
		
		if (locationManager.location != nil) {
			// location data is already present so unwrap it
			coordinate = locationManager.location!.coordinate
			altitude = locationManager.location!.altitude
		} else {
			// receive the location data
			coordinate = CLLocationCoordinate2D()
			altitude = CLLocationDistance()
		}
		
        if (locationManager.heading != nil) {
            magHeading = locationManager.heading!.magneticHeading
        } else {
            magHeading = 0.0
        }
        
		let newEvent = Event(context: managedObjectContext)
		newEvent.name = eventName
		newEvent.latitude = coordinate.latitude as NSNumber
		newEvent.longitude = coordinate.longitude as NSNumber
		newEvent.magneticHeading = magHeading as NSNumber
		newEvent.altitude = altitude as NSNumber
		newEvent.time = Date()
		
		do {
			try managedObjectContext.save()
		} catch {
			print("Error saving")
		}
	}
}
