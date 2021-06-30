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

    func title()-> NSAttributedString {
        return datum.mainTitle()
    }
    
    func url()-> URL? {
        // imageView
        return imageURL
    }

    func subTitle()-> NSAttributedString {
        return datum.subtitle()
    }
}
