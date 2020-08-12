//
//  ActiveRefPointTests.swift
//  AMELTests
//
//  Created by Neil Marcellini on 8/12/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//
import XCTest
@testable import AMEL
import CoreData

class RefPointCalculationsTests: XCTestCase {
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHeading() {
        //ensure heading is from reference point to pilot
        let pilotLat = 34.0855794
        let pilotLong = -119.0696898
        
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        let refPoint = ReferencePoint(context: context)
        refPoint.isActive = true
        refPoint.latitude = 34.1207236
        refPoint.longitude = -119.1399851
        
        let RPLat: Double = Double(truncating: refPoint.latitude!)
        let RPLong: Double = Double(truncating: refPoint.longitude!)
        let heading = RadialCoordinateCalculations.referencePointBearing(latOfPilot: pilotLat, lngOfPilot: pilotLong, latOfBE: RPLat, lngOfBE: RPLong)
        // 121 found via https://planetcalc.com/7042/
        XCTAssert(heading == 121, "\(heading) == 121")
    }
}
