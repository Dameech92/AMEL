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
        let testTime = formatter.date(from: "15:30:21 (16-Apr-20)")
        self.testEvent.time = testTime
        let eventVM = EventViewModel(event: self.testEvent)
        XCTAssertEqual("15:30:21 (16-Apr-20)", eventVM.getTime())
    }
    
}
