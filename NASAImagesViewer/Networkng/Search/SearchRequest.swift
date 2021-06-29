//
//  SearchRequest.swift
//  NASAImagesViewer
//
//  Created by kayeli dennis on 27/06/2021.
//

import Foundation

class SearchRequest: APIRequest {
    var method = RequestType.GET
    var path = "search"
    var parameters = [String: String]()

    init(query: String) {
        parameters["q"] = query
    }
}
