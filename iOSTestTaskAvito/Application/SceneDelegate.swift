//
//  SceneDelegate.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 28.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)

        let navigationController = UINavigationController()
        navigationController.navigationBar.tintColor = .label
        let assemblyBuilder = AssemblyBuilderImpl()
        let router = RouterImpl(navigationController: navigationController, assemblyBuilder: assemblyBuilder)
        router.initial()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
