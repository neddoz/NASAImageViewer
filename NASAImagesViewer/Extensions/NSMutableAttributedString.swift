//
//  NSMutableAttributedString.swift
//  NASAImagesViewer
//
//  Created by kayeli dennis on 30/06/2021.
//

import UIKit

extension NSMutableAttributedString {
    var fontSize: CGFloat { return 16 }
    var boldFont: UIFont { return UIFont.boldSystemFont(ofSize: fontSize) }
    var normalFont: UIFont { return UIFont.systemFont(ofSize: 12)}

    func bold(_ value:String) -> NSMutableAttributedString {

        let attributes:[NSAttributedString.Key : Any] = [
            .font : boldFont
        ]

        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }

    func normal(_ value:String) -> NSMutableAttributedString {

        let attributes:[NSAttributedString.Key : Any] = [
            .font : normalFont,
            .foregroundColor: UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1.0)
        ]

        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
}
