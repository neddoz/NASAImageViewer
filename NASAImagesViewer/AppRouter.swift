//
//  AppRouter.swift
//  NASAImagesViewer
//
//  Created by kayeli dennis on 27/06/2021.
//

import UIKit

final class AppRouter {

    static let shared = AppRouter()
    
    lazy var homeViewController = {
        return HomeViewController()
    }()
    
    fileprivate lazy var root = UINavigationController(rootViewController: homeViewController)

    public func rootController() -> UIViewController {
        root.isNavigationBarHidden = false
        return root
    }
    
    init() {
        root.navigationBar.prefersLargeTitles = true
    }
}
