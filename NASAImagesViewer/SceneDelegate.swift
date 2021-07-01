//
//  SceneDelegate.swift
//  NASAImagesViewer
//
//  Created by kayeli dennis on 27/06/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let rootViewController = AppRouter.shared.rootController()
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        self.window?.rootViewController = rootViewController
        self.window?.makeKeyAndVisible()
    }
}
