//
//  MockClient.swift
//  NASAImagesViewerTests
//
//  Created by kayeli dennis on 30/06/2021.
//

import Foundation
import RxSwift

class MockClient: APIServiceProtocol {

    var mockSuccess: Bool = false
    
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

    func getSampleItem()-> Item {
        return .init(href: "sample_url", links: [], data: [getsampleDatum()])
    }
    
    func getSampleSearchResult()-> SearchResult {
        return .init(collection: Collection(items: [getSampleItem()],
                                            version: "version 1",
                                            href: "some href",
                                            links: [],
                                            metadata: Metadata(totalHits: 0)))
    }
}

extension MockClient {
    static var shared: APIServiceProtocol {
        return MockClient()
    }
    
    func send<T>(apiRequest: APIRequest) -> Observable<Result<T, Error>> where T : Decodable, T : Encodable {
        if mockSuccess {
            return Observable.just(.success(getSampleSearchResult() as! T))
        } else {
            return Observable.just(.failure(NetworkError.DecodingFailure(errorMessage: "Failed to decode")))
        }
    }
}
