//
//  ImageView.swift
//  NASAImagesViewer
//
//  Created by kayeli dennis on 29/06/2021.
//

import UIKit

extension UIImageView {
    func  loadImage(from url: URL) {
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) as? UIImage {
            DispatchQueue.main.async {
                self.image = cachedImage
                return
            }
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    imageCache.setObject(image, forKey: url.absoluteString as NSString)
                    self.image = image
                }
            }
        }
        task.resume()
    }
}
