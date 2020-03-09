//  AMELTests.swift
//  AMELTests
//
//  Created by Richard Zins on 3/8/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//
import Foundation
import SwiftUI
import XCTest
import CoreLocation
import CoreData
@testable import AMEL

class AMELTests: XCTestCase {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @ObservedObject private var lm = LocationManager()
    @FetchRequest(fetchRequest: Event.getEvents()) var eventItems:FetchedResults<Event>
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        //Tests that way for getting lat and lng work
        let coordinate = self.lm.location != nil ?
            self.lm.location!.coordinate : CLLocationCoordinate2D()
        XCTAssertNotNil(coordinate)
        
        //Tests that our way gettin altittude works
        let altitude = self.lm.location != nil ? self.lm.location!.altitude : CLLocationDistance()
        XCTAssertNotNil(altitude)
        
        //Tests that our way for getting magnetic heading works
        var magHeading = 0.0
        if self.lm.heading != nil {
            magHeading = self.lm.heading!.magneticHeading
        }
        XCTAssertNotNil(magHeading)
        
        //Tets our way of getting the date works
        let date = Date()
        XCTAssertNotNil(date)
        
        //Tests our query into core data returns any data
        let eventResults = Event.getEvents()
        XCTAssertNotNil(eventResults)
        
        let event = Event(context: managedObjectContext)
        let name = "test"
        event.name = name
        event.altitude = altitude as NSNumber
        event.magneticHeading = magHeading as NSNumber
        event.longitude = coordinate.longitude as NSNumber
        event.latitude = coordinate.latitude as NSNumber
        event.time = date
               
        do {
            try managedObjectContext.save()
        } catch {
            print("Error saving")
        }
        
        for event in self.eventItems {
            XCTAssertEqual(event.name, name)
        }

    }
    
    //Dont need performance testing at the moment
    //func testPerformanceExample() {
        // This is an example of a performance test case.
        //measure {
            // Put the code you want to measure the time of here.
        //}
    //}
}
