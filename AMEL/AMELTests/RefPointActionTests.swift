//
//  RefPointActionTests.swift
//  AMELTests
//
//  Created by Neil Marcellini on 4/27/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import XCTest
@testable import AMEL
import CoreData
class RefPointActionTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUpdateLatPicker() {
        let pickerData = PickerData()
        let latitude = "-18.23"
        let pickerUpdater = PickerUpdater(formatter: LatFormatter(), latlngData: pickerData.latPicker)
        pickerUpdater.updatePicker(latOrLng: latitude)
        let expectedDegs = 18
        let expectedMins = 13
        let expectedDotm = 8
        let expectedDirection = 1
        XCTAssertEqual(expectedDirection, pickerData.latPicker.direction)
        XCTAssertEqual(expectedDegs, pickerData.latPicker.degree)
        XCTAssertEqual(expectedMins, pickerData.latPicker.minute)
        XCTAssertEqual(expectedDotm, pickerData.latPicker.minuteTenth)
    }

}
