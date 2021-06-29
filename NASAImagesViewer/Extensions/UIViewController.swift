//
//  UIViewController.swift
//  NASAImagesViewer
//
//  Created by kayeli dennis on 29/06/2021.
//

import UIKit

extension UIViewController {
    func showAlert(_ title : String!, body : String!, showCancel : Bool = false, completion: @escaping () -> () = {}) {
        let alertController = UIAlertController(title: title, message:
            body, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: { action in
            completion()
        }))
        if showCancel {
            alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default,handler: { action in
            }))
        }

        self.present(alertController, animated: true, completion: nil)
    }
}
