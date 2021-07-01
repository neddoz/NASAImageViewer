//
//  DatumCellViewModel.swift
//  NASAImagesViewer
//
//  Created by kayeli dennis on 27/06/2021.
//

import Foundation

final class DatumCellViewModel {
    
    private let item: Item
    
    init(datum: Item) {
        self.item = datum
    }

    func imageURl()-> URL? {
        guard let string = item.links.first?.href else {return nil}
        return URL(string: string)
    }

    func text()-> NSAttributedString? {
        return item.data.first?.mainTitle()
    }

    func secondaryText()-> NSAttributedString? {
        if let item = item.data.first {
            return item.subtitle()
        }
        return nil
    }
}
