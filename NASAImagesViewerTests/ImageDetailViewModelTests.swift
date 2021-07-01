//
//  ImageDetailViewModelTests.swift
//  NASAImagesViewerTests
//
//  Created by kayeli dennis on 30/06/2021.
//

import XCTest
@testable import NASAImagesViewer

class ImageDetailViewModelTests: XCTestCase {

    var sut: ImageDetailViewModel!
    var mockClient: MockClient!

    override func setUp() {
        super.setUp()
        self.mockClient = MockClient()
        self.sut = .init(datum: mockClient.getsampleDatum(), imageURL: nil)
    }

    override func tearDown() {
        super.tearDown()
        mockClient = nil
    }

    func test_computes_Correctly() {
        let data = mockClient.getsampleDatum()
        XCTAssertEqual(sut.content(), data.datumDescription)
        XCTAssertEqual(sut.url(), nil)
        XCTAssertEqual(sut.title(), data.mainTitle())
        XCTAssertEqual(sut.subTitle(), data.subtitle())
    }
}
