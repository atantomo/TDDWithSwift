//
//  ToDoItemTests.swift
//  TDDWithSwift
//
//  Created by Andrew Tantomo on 2017/05/28.
//  Copyright © 2017年 Andrew Tantomo. All rights reserved.
//

import XCTest
@testable import TDDWithSwift
import CoreLocation

class LocationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_Init_WhenGivenCoordinate_SetsCoordinate() {
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location = Location(name: "", coordinate: coordinate)

        XCTAssertEqual(location.coordinate?.latitude, coordinate.latitude)
        XCTAssertEqual(location.coordinate?.longitude,
                       coordinate.longitude) 
    }

    func test_Init_WhenGivenName_SetsName() {
        let location = Location(name: "Foo")

        XCTAssertEqual(location.name, "Foo")
    }
}
