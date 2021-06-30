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
            .font : UIFont(name: "Helvetica Neue", size: fontSize) ?? boldFont,
            .foregroundColor: UIColor(red: 21/255, green: 21/255, blue: 21/255, alpha: 1.0)
        ]

        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }

    func normal(_ value:String) -> NSMutableAttributedString {

        let attributes:[NSAttributedString.Key : Any] = [
            .font : UIFont(name: "Helvetica Neue", size: 14) ?? UIFont.labelFontSize,
            .foregroundColor: UIColor(red: 98/255, green: 98/255, blue: 98/255, alpha: 1.0)
        ]

        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
}
