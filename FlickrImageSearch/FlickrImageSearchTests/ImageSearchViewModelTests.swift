//
//  ImageSearchViewModelTests.swift
//  FlickrImageSearchTests
//
//  Created by Amit Nalawade on 3/27/24.
//

import XCTest
@testable import FlickrImageSearch

final class ImageSearchViewModelTests: XCTestCase {
    var subject: ImageSearchViewModel!
    
    override func setUpWithError() throws {
        subject = ImageSearchViewModel()
    }
    
    override func tearDownWithError() throws {
        subject = nil
    }
    
    func testSearch_when_input_isEmpty() async throws {
        let expectation = XCTestExpectation(description: "invalid input search")
        try await subject.search(for: "")
        expectation.fulfill()
        XCTAssertTrue(subject.images.isEmpty)
        XCTAssertNotNil(subject.imageSearchError)
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testSearch_when_input_isNotEmpty() async throws {
        let expectation = XCTestExpectation(description: "valid input search")
        try await subject.search(for: "porcupine")
        expectation.fulfill()
        XCTAssertFalse(subject.images.isEmpty)
        XCTAssertNil(subject.imageSearchError)
        wait(for: [expectation], timeout: 1.0)
    }
}
