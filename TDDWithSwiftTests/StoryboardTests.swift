//
//  StoryboardTests.swift
//  TDDWithSwift
//
//  Created by Andrew Tantomo on 2017/05/28.
//  Copyright © 2017年 Andrew Tantomo. All rights reserved.
//

import XCTest
@testable import TDDWithSwift

class StoryboardTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_InitialViewController_IsItemListViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let navigationController =
            storyboard.instantiateInitialViewController()
                as! UINavigationController
        let rootViewController = navigationController.viewControllers[0]

        XCTAssertTrue(rootViewController is ItemListViewController)
    }

}
