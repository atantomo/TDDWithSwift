//
//  ItemListViewControllerTests.swift
//  TDDWithSwift
//
//  Created by Andrew Tantomo on 2017/05/28.
//  Copyright © 2017年 Andrew Tantomo. All rights reserved.
//

import XCTest
@testable import TDDWithSwift

class ItemListViewControllerTests: XCTestCase {

    var sut: ItemListViewController!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(
            withIdentifier: "ItemListViewController")
        sut = viewController as! ItemListViewController
        _ = sut.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_TableViewIsNotNilAfterViewDidLoad() {
        XCTAssertNotNil(sut.tableView)
    }

    func test_LoadingView_SetsTableViewDataSource() {
        XCTAssertTrue(sut.tableView.dataSource is ItemListDataProvider)
    }

    func test_LoadingView_SetsTableViewDelegate() {
        XCTAssertTrue(sut.tableView.delegate is ItemListDataProvider)
    }

    func test_LoadingView_SetsDataSourceAndDelegateToSameObject() {
        XCTAssertEqual(sut.tableView.dataSource as? ItemListDataProvider,
                       sut.tableView.delegate as? ItemListDataProvider)
    }

    func test_ItemListViewController_HasAddBarButtonWithSelfAsTarget() {
        let target = sut.navigationItem.rightBarButtonItem?.target
        XCTAssertEqual(target as? UIViewController, sut)
    }

    func test_AddItem_PresentsAddItemViewController() {

        XCTAssertNil(sut.presentedViewController)
        UIApplication.shared.keyWindow?.rootViewController = sut

        guard let addButton = sut.navigationItem.rightBarButtonItem else
        { XCTFail(); return }
        guard let action = addButton.action else { XCTFail(); return }

        sut.performSelector(onMainThread: action,
                            with: addButton,
                            waitUntilDone: true)

        XCTAssertNotNil(sut.presentedViewController)
        XCTAssertTrue(sut.presentedViewController is InputViewController)

        let inputViewController = sut.presentedViewController as! InputViewController
        XCTAssertNotNil(inputViewController.titleTextField)
    }

    func testItemListVC_SharesItemManagerWithInputVC() {

        guard let addButton = sut.navigationItem.rightBarButtonItem else
        { XCTFail(); return }
        guard let action = addButton.action else { XCTFail(); return }
        UIApplication.shared.keyWindow?.rootViewController = sut

        sut.performSelector(onMainThread: action,
                            with: addButton,
                            waitUntilDone: true)


        guard let inputViewController =
            sut.presentedViewController as? InputViewController else
        { XCTFail(); return }
        guard let inputItemManager = inputViewController.itemManager else
        { XCTFail(); return } 
        XCTAssertTrue(sut.itemManager === inputItemManager) 
    }

    func test_ViewDidLoad_SetsItemManagerToDataProvider() {
        XCTAssertTrue(sut.itemManager === sut.dataProvider.itemManager)
    }

    func test_ViewWillAppear_ReloadData() {

        let mockTable = MockTableView()
        sut.tableView = mockTable
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
        XCTAssertTrue(mockTable.reloaded)
    }

    func testItemSelectedNotification_PushesDetailVC() {


        let mockNavigationController = MockNavigationController(rootViewController: sut)


        UIApplication.shared.keyWindow?.rootViewController = mockNavigationController


        _ = sut.view


        NotificationCenter.default.post(
            name: NSNotification.Name("ItemSelectedNotification"),
            object: self,
            userInfo: ["index": 1])


        guard let detailViewController = mockNavigationController.pushedViewController as? DetailViewController else { XCTFail(); return }


        guard let detailItemManager = detailViewController.itemInfo?.0 else
        { XCTFail(); return }


        guard let index = detailViewController.itemInfo?.1 else
        { XCTFail(); return }


        _ = detailViewController.view
        
        
        XCTAssertNotNil(detailViewController.titleLabel) 
        XCTAssertTrue(detailItemManager === sut.itemManager) 
        XCTAssertEqual(index, 1) 
    } 

}

extension ItemListViewControllerTests {

    class MockTableView: UITableView {
        var reloaded = false

        override func reloadData() {
            reloaded = true
        }
    }

    class MockNavigationController : UINavigationController {


        var pushedViewController: UIViewController?


        override func pushViewController(_ viewController: UIViewController,
                                         animated: Bool) {
            pushedViewController = viewController
            super.pushViewController(viewController, animated: animated)
        } 
    }
}
