//  AMELTests.swift
//  AMELTests
//
//  Created by Richard Zins on 3/8/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//
import Foundation
import UIKit
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
    func testUIColor() {
        self.testEvent.color = ButtonAction.saveColor(color: UIColor.red)
        let eventVM = EventViewModel(event: testEvent)
        XCTAssertEqual(UIColor.red, eventVM.getUIColor())
    }
    func testHeadingCourse() {
        self.testEvent.magneticHeading = 270
        self.testEvent.course = 280
        let eventVM = EventViewModel(event: self.testEvent)
        XCTAssertEqual("Heading/Course: 270°/280°", eventVM.getHeadingCourse())
    }
    func testNegativeCourse() {
        self.testEvent.magneticHeading = 270
        self.testEvent.course = -1
        let eventVM = EventViewModel(event: self.testEvent)
        XCTAssertEqual("Heading/Course: 270°/---°", eventVM.getHeadingCourse())
    }
    func testNilHeading() {
        self.testEvent.course = 15
        let eventVM = EventViewModel(event: self.testEvent)
        XCTAssertEqual("Heading/Course: ---°/015°", eventVM.getHeadingCourse())
    }
    func testNilCourse() {
        self.testEvent.magneticHeading = 80
        let eventVM = EventViewModel(event: self.testEvent)
        XCTAssertEqual("Heading/Course: 080°/---°", eventVM.getHeadingCourse())
    }
    func testGroundSpeed() {
        self.testEvent.speed = 100
        let eventVM = EventViewModel(event: self.testEvent)
        XCTAssertEqual("Groundspeed: 194 nm/hr", eventVM.getGroundSpeed())
    }
    func testNilGroundSpeed() {
        let eventVM = EventViewModel(event: self.testEvent)
        XCTAssertEqual("Groundspeed: unavailable", eventVM.getGroundSpeed())
    }
}
