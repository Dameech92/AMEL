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

    func testConvertToDecimalDegrees() {
        let pickerData = PickerData()
        pickerData.latPicker.direction = 0
        pickerData.latPicker.degree = 38
        pickerData.latPicker.minute = 26
        pickerData.latPicker.minuteTenth = 2
        let refAction = ReferencePointAction(pickerData: pickerData, context: NSManagedObjectContext())
        let latitude = refAction.convertToDecimalDegrees(data: pickerData.latPicker)
        let result = 38.43666666666667 as NSNumber
        XCTAssertEqual(result, latitude)
        
    }

}
