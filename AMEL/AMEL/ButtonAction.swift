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
	
	private static func initializeEvent() {
		
	}
	
	private static func logEvent(_ newEvent:Event, _ eventName:String, _ color:UIColor) {
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
	}
	
    public static func record(_ eventName:String, _ color:UIColor, _ locationManager:LocationManager, _ managedObjectContext:NSManagedObjectContext) {
		
		if locationManager.location != nil {
            fetchExistingLocationData(locationManager)
		}
        
        if locationManager.heading != nil {
            magHeading = locationManager.heading!.magneticHeading
        }
        
        let newEvent = Event(context: managedObjectContext)
		logEvent(newEvent, eventName, color)
        
		// update the object context
        do {
            try managedObjectContext.save()
        } catch {
            print("Error saving")
        }
	}
}
