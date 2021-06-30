//
//  DatumCellViewModel.swift
//  NASAImagesViewer
//
//  Created by kayeli dennis on 27/06/2021.
//

import Foundation

final class DatumCellViewModel {
    
    private let item: Item
    var indexPath: IndexPath
    
    init(datum: Item, path: IndexPath) {
        self.item = datum
        self.indexPath = path
    }

    func imageURl()-> URL? {
        guard let string = item.links.first?.href else {return nil}
        return URL(string: string)
    }

    func text()-> String? {
        return item.data.first?.mainTitle()
    }

    func secondaryText()-> String? {
        if let item = item.data.first {
            return item.subtitle()
        }
        return ""
    }
}
