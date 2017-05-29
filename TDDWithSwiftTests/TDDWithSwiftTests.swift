//
//  TDDWithSwiftTests.swift
//  TDDWithSwiftTests
//
//  Created by Andrew Tantomo on 2017/05/27.
//  Copyright © 2017年 Andrew Tantomo. All rights reserved.
//

import XCTest
@testable import TDDWithSwift

class TDDWithSwiftTests: XCTestCase {

    var viewController: ViewController!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewController = ViewController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

    func test_NumberOfVowels_WhenPassedDominik_ReturnsThree() {
        let string = "Dominik"
        let numberOfVowels = viewController.numberOfVowels(in: string)
//        XCTAssertEqual(numberOfVowels, 4, "should find 3 vowels in Dominik",
//                       file: "TDDWithSwiftTests.swift",
//                       line: 36)
        XCTAssertEqual(numberOfVowels, 3, "should find 3 vowels in Dominik")
    }

    func test_MakeHeadline_ReturnsStringWithEachWordStartCapital() {
        let input = "this is A test headline"
        let expectedOutput = "This Is A Test Headline"

        let headline = viewController.makeHeadline(from: input)
        XCTAssertEqual(headline, expectedOutput)
    }

    func test_MakeHeadline_ReturnsStringWithEachWordStartCapital2() {
        let input = "Here is another Example"
        let expectedOutput = "Here Is Another Example"

        let headline = viewController.makeHeadline(from: input)
        XCTAssertEqual(headline, expectedOutput)
    }
}

// It's good practice to have a test case for each class in the main target.

//XCTAssertTrue(_:_:file:line:): This asserts that an expression is true
//XCTAssertFalse(_:_:file:line:): This asserts that an expression is false
//XCTAssertEqual(_:_:_:file:line:): This asserts that two expressions are equal
//XCTAssertEqualWithAccuracy(_:_:accuracy:_:file:line:): This asserts that two expressions are the same, taking into account the accuracy defined in the accuracy parameter
//XCTAssertNotEqual(_:_:_:file:line:): This asserts that two expression are not equal
//XCTAssertNil(_:_:file:line:): This asserts that an expression is nil
//XCTAssertNotNil(_:_:file:line:): This asserts that an expression is not nil
//XCTFail(_:file:line:): This always fails


//To start the TDD workflow, we need a failing test. The following questions need to be considered when writing the test:
//
//Precondition: What is the state of the system before we invoke the method?
//Invocation: How should the signature of the method look? What are the input parameters (if any) of the method?
//Assertion: What is the expected result of the method invocation?
