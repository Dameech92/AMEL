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
    
    class MockEvent: NSObject, EventProtocol {
        static func getEvents() -> NSFetchRequest<Event> {
            return NSFetchRequest<Event>()
        }
        
        var managedObjectContext: NSManagedObjectContext?
        var time:Date?
        var name:String?
        var latitude:NSNumber?
        var longitude:NSNumber?
        var altitude:NSNumber?
        var magneticHeading:NSNumber?
        var course:NSNumber?
        var color:Data?
        var speed:NSNumber?
    }
    
    let lm = LocationViewModel()
    let hlm = HeadingViewModel()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        //Tests that getLongitude() and getLatitude() work
        XCTAssertNotNil(lm.getLongitude())
        XCTAssertNotNil(lm.getLatitude())
        
        //Tests our getAltitude() works
        XCTAssertNotNil(lm.getAltitude())
        
        //Tests our getMagHeading works
        XCTAssertNotNil(hlm.getMagHeading())
        
        //Tets our way of getting the date works
        let date = Date()
        XCTAssertNotNil(date)
        
        //Tests our query into core data returns any data
        let eventResults = Event.getEvents()
        XCTAssertNotNil(eventResults)
    }
    func testGetDMS() {
        let formatter = LatLngFormatter(latitude: 40.76, longitude: -73.984)
        XCTAssertEqual("40-45.6", formatter.getDMS(number: 40.76))
    }
    
    
    //Dont need performance testing at the moment
    //func testPerformanceExample() {
        // This is an example of a performance test case.
        //measure {
            // Put the code you want to measure the time of here.
        //}
    //}
}
