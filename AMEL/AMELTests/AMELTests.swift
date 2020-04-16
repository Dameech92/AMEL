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
    let formatter = LatLngFormatter(latitude: 0, longitude: 0)
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
        XCTAssertEqual("40-45.6", self.formatter.getDMS(number: 40.76))
        XCTAssertEqual("73-59.0", self.formatter.getDMS(number: -73.984))
    }
    func testGetDMSRounding() {
        XCTAssertEqual("73-58.5", self.formatter.getDMS(number: -73.974895))
    }
    func testLatZero() {
        XCTAssertEqual("N00-00.0", self.formatter.formatLatitude(latitude: 0))
    }
    func testLatFormatN() {
        XCTAssertEqual("N40-45.6", self.formatter.formatLatitude(latitude: 40.76))
    }
    func testLatFormatS() {
        XCTAssertEqual("S21-02.9", self.formatter.formatLatitude(latitude: -21.047977))
    }
    func testLngZero() {
        XCTAssertEqual("E00-00.0", self.formatter.formatLongitude(longitude: 0))
    }
    func testLngFormatW() {
        XCTAssertEqual("W122-00.0", self.formatter.formatLongitude(longitude: -122))
    }
    func testLngFormatS() {
        XCTAssertEqual("E122-00.0", self.formatter.formatLongitude(longitude: 122))
    }
    func testLatLngFormat() {
        let sut = LatLngFormatter(latitude: 34.1622265, longitude: -119.0440182)
        XCTAssertEqual("N34-09.7 W119-02.6", sut.getLatLng())
    }
    
    
    //Dont need performance testing at the moment
    //func testPerformanceExample() {
        // This is an example of a performance test case.
        //measure {
            // Put the code you want to measure the time of here.
        //}
    //}
}
