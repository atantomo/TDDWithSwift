//
//  TDDWithSwiftUITests.swift
//  TDDWithSwiftUITests
//
//  Created by Andrew Tantomo on 2017/06/09.
//  Copyright © 2017年 Andrew Tantomo. All rights reserved.
//

import XCTest

class TDDWithSwiftUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.


        continueAfterFailure = false
        XCUIApplication().launch()

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related function

        XCUIApplication().navigationBars["TDDWithSwift.ItemListView"].buttons["Add"].tap()
        
        let app = XCUIApplication()

        let titleTextField = app.textFields["title"]
        titleTextField.tap()
        titleTextField.typeText("ELEPHANT MISIA")
        
        let dateTextField = app.textFields["date"]
        dateTextField.tap()
        dateTextField.typeText("01/24/2016")
        
        let locationTextField = app.textFields["location"]
        locationTextField.tap()
        locationTextField.typeText("Tokyo")

        let addressTextField = app.textFields["address"]
        addressTextField.tap()
        addressTextField.typeText("Shibuya")
        
        let descriptionTextField = app.textFields["description"]
        descriptionTextField.tap()
        descriptionTextField.typeText("Butterfly Butterfly")
        
        let saveButton = app.buttons["save"]
        saveButton.tap()

        XCTAssertTrue(app.tables.staticTexts["ELEPHANT MISIA"].exists)
        XCTAssertTrue(app.tables.staticTexts["01/24/2016"].exists)
        XCTAssertTrue(app.tables.staticTexts["Tokyo"].exists)


    }
    
}
