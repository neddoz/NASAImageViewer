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

    func rootController() -> UIViewController {
        root.isNavigationBarHidden = false
        return root
    }

    func presentImageDetailViewController(for item: Datum, imageURL: URL?) {
        let viewModel = ImageDetailViewModel(datum: item, imageURL: imageURL)
        let vc = ImageDetailViewController(viewModel: viewModel)
        root.navigationBar.prefersLargeTitles = false
        self.root.pushViewController(vc, animated: false)
    }

    init() {
        root.navigationBar.prefersLargeTitles = true
    }
}
