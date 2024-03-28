//
//  ImageModelTests.swift
//  FlickrImageSearchTests
//
//  Created by Amit Nalawade on 3/27/24.
//

import XCTest
@testable import FlickrImageSearch

final class ImageModelTests: XCTestCase {
    var subject: ImageModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        subject = ImageModel(
            title: "Great Horned Owl (Bubo virginianus)",
            link: "https://www.flickr.com/photos/73683441@N07/53519787842/",
            media: ["m": "https://live.staticflickr.com/65535/53519787842_d5ae013842_m.jpg"],
            dateTaken: "2016-06-21T14:15:44-08:00",
            description: """
            Little Women Channel</a> posted a photo:</p> <p><a href="https://www.flickr.com/photos/196488182@N03/52408768979/" title="Marriages in Little Women"><img
            src="https://live.staticflickr.com/65535/52408768979_9b85bab5c8_m.jpg" width="200" height="150" alt="Marriages in Little Women" />
            """,
            published: "2024-02-10T17:14:29Z",
            author: "nobody@flickr.com (\"Gerald (Wayne) Prout\")",
            authorId: "73683441",
            tags: "trail greathornedowl bubovirginianus porcupineskirunners townofschumacher townshipoftisda"
        )
    }

    override func tearDownWithError() throws {
        subject = nil
        try super.tearDownWithError()
    }
    
    func test_publishedDateFormatting() {
        XCTAssertEqual(subject.formattedPublishedDate, "Feb 10, 2024 12:14:29")
    }
    
    func test_mediaUrl() {
        XCTAssertEqual(subject.url, URL(string: "https://live.staticflickr.com/65535/53519787842_d5ae013842_m.jpg"))
    }
    
    func test_imageWidth() {
        XCTAssertEqual(subject.imageWidth, "200")
    }
    
    func test_imageHeight() {
        XCTAssertEqual(subject.imageHeight, "150")
    }
}
