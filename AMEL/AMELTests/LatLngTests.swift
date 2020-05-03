//
//  LatLngTests.swift
//  AMELTests
//
//  Created by Neil Marcellini on 4/16/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import XCTest
import CoreData
@testable import AMEL

class LatLngTests: XCTestCase {
    let formatter = LatLngFormatter(latitude: 0, longitude: 0)

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
}
