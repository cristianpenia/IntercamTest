//
//  SceneDelegate.swift
//  IntercamTest
//
//  Created by Cristian Peña Barrios on 05/06/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var mainCoordinators: MainCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        
        let navigationController = UINavigationController()
        
        mainCoordinators = MainCoordinator(navigationController: navigationController)
        window?.rootViewController = navigationController
        
        window?.makeKeyAndVisible()
        mainCoordinators?.start()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}

