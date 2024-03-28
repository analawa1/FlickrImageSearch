//
//  FlickrImageSearchUITests.swift
//  FlickrImageSearchUITests
//
//  Created by Amit Nalawade on 3/26/24.
//

import XCTest

final class FlickrImageSearchUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launch()
    }
    
    func testNavigationFlow() throws {
        let app = XCUIApplication()
        
        let imagesearchNavigationBar = app.navigationBars["ImageSearch"]
        let startTypingToSearchSearchField = imagesearchNavigationBar.searchFields["Start typing to search"]
        startTypingToSearchSearchField.tap()
        startTypingToSearchSearchField.typeText("p")
        
        app.scrollViews.containing(.other, identifier:"Vertical scroll bar, 2 pages")
            .children(matching: .other).element(boundBy: 0)
            .children(matching: .other).element.tap()
        app.navigationBars["Image Detail"].buttons["ImageSearch"].tap()
        
        startTypingToSearchSearchField.tap()
        imagesearchNavigationBar.buttons["Cancel"].tap()
    }
}
