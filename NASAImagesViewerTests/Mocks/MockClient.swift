//
//  MockClient.swift
//  NASAImagesViewerTests
//
//  Created by kayeli dennis on 30/06/2021.
//

import Foundation
@testable import NASAImagesViewer

class MockClient {

    func getsampleDatum()-> Datum {
        let today = Date()
        return .init(keywords: ["Mars","2001 Mars Odyssey"],
                     mediaType: .image,
                     nasaID: "PIA05602",
                     dateCreated: today,
                     datumDescription: "THEMIS Images",
                     center: .hq,
                     title: "THEMIS Images",
                     photographer: "Tom Trower",
                     description508: "THEMIS Images",
                     secondaryCreator: "NASA/JPL/Arizona State University",
                     location: "Cosmonaut Hotel",
                     album: ["SpaceX_CRS-22_Science"])
    }
}
