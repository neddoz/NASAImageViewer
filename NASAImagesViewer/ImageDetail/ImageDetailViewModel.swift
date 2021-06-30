//
//  ImageDetailViewModel.swift
//  NASAImagesViewer
//
//  Created by kayeli dennis on 29/06/2021.
//

import Foundation

class ImageDetailViewModel {
    var datum: Datum
    var imageURL: URL

    init(datum: Datum, imageURL: URL) {
        self.datum = datum
        self.imageURL = imageURL
    }

    func content()-> String {
        return datum.datumDescription
    }

    func title()-> String {
        return datum.mainTitle()
    }
    
    func url()-> URL? {
        // imageView
        let replaced = imageURL.absoluteString.replacingOccurrences(of: "~thumb", with: "~orig")
        return URL(string: replaced)
    }

    func subTitle()-> String {
        return datum.subtitle()
    }
}
