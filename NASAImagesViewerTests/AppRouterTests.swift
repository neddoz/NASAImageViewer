//
//  AppRouterTests.swift
//  NASAImagesViewerTests
//
//  Created by kayeli dennis on 30/06/2021.
//

import Foundation
import XCTest
@testable import NASAImagesViewer

class ApprouterTests: XCTestCase {
    let sut = AppRouter.shared
    var item: Datum?
    
    override func setUp() {
        super.setUp()
        item = .init(keywords: nil,
                     mediaType: .image,
                     nasaID: "",
                     dateCreated: Date(),
                     datumDescription: "",
                     center: Center.hq,
                     title: "",
                     photographer: nil,
                     description508: "",
                     secondaryCreator: "",
                     location: "",
                     album: nil)
    }

    override func tearDown() {
        item = nil
        super.tearDown()
    }

    func test_root_view_controller_is_HomeViewcontroller() {
        guard let nav = sut.rootController() as? UINavigationController else {
            return XCTFail("Failed to grab the navigation controller on the router object")
        }
        XCTAssert(nav.viewControllers.first is HomeViewController)
    }
    
    func test_routes_to_image_detail_view_controller() {
        guard let item = item else {
            return XCTFail("Failed to get the datum")
        }
        
        guard let nav = sut.rootController() as? UINavigationController else {
            return XCTFail("Failed to grab the navigation controller on the routeer object")
        }
        
        sut.presentImageDetailViewController(for: item, imageURL: URL(string: "test_url")!)
        XCTAssert(nav.viewControllers.last is ImageDetailViewController)
    }
}
