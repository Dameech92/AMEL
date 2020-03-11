//
//  AMELUITests.swift
//  AMELUITests
//
//  Created by Richard Zins on 3/8/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//
import XCTest

class AMELUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
    
        let app = XCUIApplication()
        app.launch()
        app.buttons["Bomb"].tap()
        app.buttons["Missile"].tap()
        app.buttons["Radar Jam"].tap()
        app.buttons["Custom 1"].tap()
        app.buttons["Custom 2"].tap()
        app.buttons["Custom 3"].tap()
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Log"].tap()
        tabBarsQuery.buttons["Settings"].tap()
        tabBarsQuery.buttons["Record Events"].tap()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    //func testLaunchPerformance() {
        //if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            //measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                //XCUIApplication().launch()
            //}
        //}
    //}
}
