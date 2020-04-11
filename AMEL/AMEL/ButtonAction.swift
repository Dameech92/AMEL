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

// when a button is pressed, record information such as where and when the button was pressed
struct ButtonAction {
	private static var latitude: CLLocationDegrees = 0.0
	private static var longitude: CLLocationDegrees = 0.0
	private static var altitude: CLLocationDistance = 0.0
	private static var magHeading: CLLocationDirection = 0.0
	
	// If a location already exists (not nil), then fetch the existing data
	private static func fetchExistingLocationData(_ locationManager: LocationManager) {
		ButtonAction.latitude = locationManager.location!.coordinate.latitude
		ButtonAction.longitude = locationManager.location!.coordinate.longitude
		ButtonAction.altitude = locationManager.location!.altitude
	}
	
	public static func createEvent(_ managedObjectContext:NSManagedObjectContext) -> Event {
		return Event(context: managedObjectContext)
	}
	
	public static func logEvent(_ newEvent:Event, _ eventName:String, _ color:UIColor, _ managedObjectContext:NSManagedObjectContext) {
		// Store the data calculated from the record function within newEvent
		newEvent.name = eventName
        newEvent.latitude = latitude as NSNumber
        newEvent.longitude = longitude as NSNumber
        newEvent.altitude = altitude as NSNumber
        newEvent.magneticHeading = magHeading as NSNumber
        newEvent.time = Date()
		
		// Fetch the event color
		do {
            try newEvent.color = NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false)
        } catch {
            newEvent.color = nil
        }
		
		// update the object
		do {
            try managedObjectContext.save()
        } catch {
            print("Error saving")
        }
	}
	
    public static func record(_ locationManager:LocationManager) {
		
		if locationManager.location != nil {
            fetchExistingLocationData(locationManager)
		}
        
        if locationManager.heading != nil {
            magHeading = locationManager.heading!.magneticHeading
        }
	}
}
