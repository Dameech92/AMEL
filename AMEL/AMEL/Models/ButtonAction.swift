
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
    private static var referencePointHeading: Int = 0
    private static var referencePointDis: Double = 0.0
    private static var referencePointName: String = " "
	
    
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
        newEvent.referencePointHeading = referencePointHeading as NSNumber
        newEvent.referencePointDis = referencePointDis as NSNumber
        newEvent.referencePointName = referencePointName
		
		do {
            try managedObjectContext.save()
        } catch {
            print("Error saving")
        }
    }
    
    
    public static func record(_ eventName:String, _ color:String, _ locationManager:LocationManager, _ managedObjectContext:NSManagedObjectContext, points: FetchedResults<ReferencePoint>) {
		if locationManager.location != nil {
            fetchCurrentLocationData(locationManager)
		}
        
        if locationManager.heading != nil {
            magHeading = locationManager.heading!.magneticHeading
        }
        func getLatRaw()->Double{
            if locationManager.location != nil{
                return (locationManager.location?.coordinate.latitude)! as Double
            }else {
                return 0.0
            }
        }
        
        func getLongRaw()->Double{
            if locationManager.location != nil{
                return (locationManager.location?.coordinate.longitude)! as Double
            }else {
                return 0.0
            }
        }
        
        let pLat = getLatRaw()
        let pLong = getLongRaw()
        
        let activePointVM = ActiveRefPointVM(points: points)
        let distance = activePointVM.getReferencePointDistance(pLat: pLat, pLong: pLong)
        if distance != nil {
            ButtonAction.referencePointDis = distance!
        } else {
            ButtonAction.referencePointDis = -1
        }
        
        let heading = activePointVM.getReferencePointHeading(pLat: pLat, pLong: pLong)
        if heading != nil {
            ButtonAction.referencePointHeading = heading!
        } else {
            ButtonAction.referencePointHeading = -1
        }
        ButtonAction.referencePointName = activePointVM.getReferencePointName()
	}
}
