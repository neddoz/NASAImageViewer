//
//  HomeViewModelTests.swift
//  NASAImagesViewerTests
//
//  Created by kayeli dennis on 01/07/2021.
//

import Foundation

import XCTest
@testable import NASAImagesViewer

class HomeViewModelTests: XCTestCase {

    var sut: HomeViewModel!
    var mockClient: MockClient!

    override func setUp() {
        super.setUp()
        self.mockClient = MockClient()
        self.sut = .init(doIntialFetch: false)
    }

    override func tearDown() {
        super.tearDown()
        mockClient = nil
        self.sut = nil
    }

    func test_computes_Correctly_On_Sucess() {
        mockClient.mockSuccess = true
        
        sut.fetchItems(with: "\"\"", client: self.mockClient)
        
        XCTAssertEqual(sut.items.value.count, 1)
        XCTAssertEqual(sut.nextItemsLink, nil)
        XCTAssertEqual(sut.numberOfRows(), 1)
    }

    func test_computes_Correctly_On_Failure() {
        sut.fetchItems(with: "\"\"", client: self.mockClient)
        
        XCTAssert(sut.error.value is NetworkError)
        XCTAssertEqual(sut.nextItemsLink, nil)
        XCTAssertEqual(sut.numberOfRows(), 0)
    }
}
