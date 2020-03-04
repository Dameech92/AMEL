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
	// cannot create locationManager and managedObjectContext here since those two are part of ContentView
	
	public static func record(_ eventName:String, _ locationManager:LocationManager, _ managedObjectContext:NSManagedObjectContext) {
		let coordinate = locationManager.location != nil ? locationManager.location!.coordinate : CLLocationCoordinate2D()
		let altitude = locationManager.location != nil ? locationManager.location!.altitude : CLLocationDistance()
		let newEvent = Event(context: managedObjectContext)
		newEvent.name = eventName
		newEvent.latitude = coordinate.latitude as NSNumber
		newEvent.longitude = coordinate.longitude as NSNumber
		newEvent.altitude = altitude as NSNumber
		newEvent.time = Date()
		
		do {
			try managedObjectContext.save()
		} catch {
			print("Error saving")
		}
	}
}
