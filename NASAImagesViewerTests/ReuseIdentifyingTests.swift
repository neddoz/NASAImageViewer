//
//  ReuseIdentifyingTests.swift
//  NASAImagesViewerTests
//
//  Created by kayeli dennis on 27/06/2021.
//

import XCTest
@testable import NASAImagesViewer

class ReuseIdentifyingTests: XCTest {
    
    func test_reuseIdentifier_classIsCalledSomeClass_isSomeClass() {
        class SomeClass: ReuseIdentifying {}
        XCTAssertEqual("SomeClass", SomeClass.reuseIdentifier)
    }
}
