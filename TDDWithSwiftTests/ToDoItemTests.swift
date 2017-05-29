//
//  ToDoItemTests.swift
//  TDDWithSwift
//
//  Created by Andrew Tantomo on 2017/05/28.
//  Copyright © 2017年 Andrew Tantomo. All rights reserved.
//

import XCTest
@testable import TDDWithSwift

class ToDoItemTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Init_TakesTitle() {
        let item = ToDoItem(title: "Foo")
        XCTAssertEqual(item.title, "Foo", "should set title")
    }

    func test_Init_WhenGivenDescription_SetsDescription() {
        let item = ToDoItem(title: "", itemDescription: "Bar")
        XCTAssertEqual(item.itemDescription, "Bar",
                       "should set itemDescription")
    }

    func test_Init_WhenGivenTimestamp_SetsTimestamp() {
        let item = ToDoItem(title: "", timestamp: 0.0)
        XCTAssertEqual(item.timestamp, 0.0, "should set timestamp")
    }

    func test_Init_WhenGivenLocation_SetsLocation() {
        let location = Location(name: "Foo")
        let item = ToDoItem(title: "", location: location)

        XCTAssertEqual(item.location?.name, location.name,
                       "should set location")
    }
    
}

// Open Project Navigator, and hold down the option key while clicking on ToDoItem.swift in the navigator to open it in the Assistant Editor
// It's quite common to use a pattern like test_<method name>_<precondition>_<expected behavior>
