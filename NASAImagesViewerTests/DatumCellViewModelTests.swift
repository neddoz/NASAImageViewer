//
//  NASAImagesViewerTests.swift
//  NASAImagesViewerTests
//
//  Created by kayeli dennis on 27/06/2021.
//

import XCTest
@testable import NASAImagesViewer

class DatumCellViewModelTests: XCTestCase {
    var sut: DatumCellViewModel!
    var mockClient: MockClient!

    override func setUp() {
        super.setUp()
        self.mockClient = MockClient()
        self.sut = .init(datum: mockClient.getSampleItem())
    }

    override func tearDown() {
        super.tearDown()
        mockClient = nil
    }

    func test_computes_Correctly() {
        let item = mockClient.getSampleItem()
        XCTAssertEqual(sut.text(), item.data.first?.mainTitle())
        XCTAssertEqual(sut.imageURl(), nil)
        XCTAssertEqual(sut.secondaryText(), item.data.first?.subtitle())
    }
}
