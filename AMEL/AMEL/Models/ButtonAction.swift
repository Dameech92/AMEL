
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
    private static var course: CLLocationDirection = 0.0
    private static var speed: CLLocationSpeed = 0.0
    private static var refPointHeading: Double = 0.0
    private static var refPointDis: Double = 0.0
    private static var refPointName: String = " "
	
    
	private static func fetchCurrentLocationData(_ locationManager: LocationManager) {
		ButtonAction.latitude = locationManager.location!.coordinate.latitude
		ButtonAction.longitude = locationManager.location!.coordinate.longitude
		ButtonAction.altitude = locationManager.location!.altitude
        ButtonAction.course = locationManager.location!.course
        ButtonAction.speed = locationManager.location!.speed
        
	}
	
	public static func createEvent(_ managedObjectContext:NSManagedObjectContext) -> Event {
		return Event(context: managedObjectContext)
	}
	
	public static func saveEvent(_ newEvent:Event, _ eventName:String, _ color:
        String, _ managedObjectContext:NSManagedObjectContext) {
		// Store the data calculated from the record function within newEvent
		newEvent.name = eventName
        newEvent.latitude = latitude as NSNumber
        newEvent.longitude = longitude as NSNumber
        newEvent.altitude = altitude as NSNumber
        newEvent.magneticHeading = magHeading as NSNumber
        newEvent.time = Date()
        newEvent.course = course as NSNumber
        newEvent.speed = speed as NSNumber
        newEvent.color = color
        newEvent.refPointHeading = refPointHeading as NSNumber
        newEvent.refPointDis = refPointDis as NSNumber
        newEvent.refPointName = refPointName
		
		do {
            try managedObjectContext.save()
        } catch {
            print("Error saving")
        }
    }
    
    public static func record(_ eventName:String, _ color:String, _ locationManager:LocationManager, _ managedObjectContext:NSManagedObjectContext, _ refPointVM:ActiveRefPointVM) {
		if locationManager.location != nil {
            fetchCurrentLocationData(locationManager)
		}
        
        if locationManager.heading != nil {
            magHeading = locationManager.heading!.magneticHeading
        }
        
        ButtonAction.refPointDis = refPointVM.getReferencePointDistance()
        ButtonAction.refPointHeading = refPointVM.getReferencePointHeading()
        ButtonAction.refPointName = refPointVM.getReferencePointName()
	}
}
