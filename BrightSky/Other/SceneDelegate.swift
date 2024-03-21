//
//  SceneDelegate.swift
//  BrightSky
//
//  Created by Razumov Pavel on 22.12.2023.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
    
        let window = UIWindow(windowScene: scene)
        let nav = UINavigationController(rootViewController: WeatherViewController())
        window.rootViewController = nav
        window.makeKeyAndVisible()
        self.window = window
    }
}

