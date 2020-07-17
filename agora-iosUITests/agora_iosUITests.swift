//
//  agora_iosUITests.swift
//  agora-iosUITests
//
//  Created by Siddharth sen on 3/17/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

import XCTest

class agora_iosUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_valid_login_with_username() {
        let app = XCUIApplication()
        app.launch()
        sleep(1)
        app.buttons["Login"].tap()
        
        let loginViewElementsQuery = app.scrollViews.otherElements.containing(.image, identifier:"login_tree")
        loginViewElementsQuery.children(matching: .textField).element.tap()
        loginViewElementsQuery.children(matching: .textField).element.typeText("test952\n")
        
        loginViewElementsQuery.children(matching: .secureTextField).element.tap()
        sleep(1)
        loginViewElementsQuery.children(matching: .secureTextField).element.typeText("test952\n")
        app.scrollViews.otherElements.buttons["Sign In"].tap()

        // Wait for 5 sec for existence of dashboard view
        let label = app.staticTexts["     Hello,\n" + "test952"]
        let exists = NSPredicate(format: "exists == 1")

        expectation(for: exists, evaluatedWith: label, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)

    }
    
    func test_invalid_login_with_username(){
        let app = XCUIApplication()
        app.launch()

        app.buttons["Login"].tap()
        
        let loginViewElementsQuery = app.scrollViews.otherElements.containing(.image, identifier:"login_tree")
        loginViewElementsQuery.children(matching: .textField).element.tap()
        loginViewElementsQuery.children(matching: .textField).element.typeText("invalidUser\n")
        loginViewElementsQuery.children(matching: .secureTextField).element.tap()
        loginViewElementsQuery.children(matching: .secureTextField).element.typeText("invalidUser\n")
        app.scrollViews.otherElements.buttons["Sign In"].tap()
        
        let alertDialog = app.alerts["Incorrect username and / or password."]
        XCTAssert(alertDialog.exists)
    }
    
    func test_logout_from_account(){
        let app = XCUIApplication()
        app.tabBars.buttons["Settings"].tap()
        app.buttons["Logout"].tap()
        app.alerts["Log out?"].scrollViews.otherElements.buttons["Yes"].tap()
        XCTAssertTrue(app.images["boy_ship"].exists)
    }
    
    func test_add_new_election_for_user(){
        
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
