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

class EventViewModelTests: XCTestCase {
    
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
    
    var testEvent = MockEvent()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.testEvent = MockEvent()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testName() {
        self.testEvent.name = "Missile"
        let eventVM = EventViewModel(event: testEvent)
        XCTAssertEqual("Missile", eventVM.getName())
    }
    func testNillName() {
        let eventVM = EventViewModel(event: self.testEvent)
        XCTAssertNotNil(eventVM.getName())
    }
    func testTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss (dd-MMM-YY)"
        let testTime = Date()
        self.testEvent.time = Date()
        let eventVM = EventViewModel(event: self.testEvent)
        let timeString = formatter.string(from: testTime)
        XCTAssertEqual(timeString, eventVM.getTime())
    }
    func testAltitude() {
        self.testEvent.altitude = 8024 //in meters
        let eventVM = EventViewModel(event: self.testEvent)
        XCTAssertEqual("Altitude: 26325ft HAE", eventVM.getAltitude())
    }
    func testNilAltitude() {
        let eventVM = EventViewModel(event: self.testEvent)
        XCTAssertEqual("Altitude: unavailable", eventVM.getAltitude())
    }
}
