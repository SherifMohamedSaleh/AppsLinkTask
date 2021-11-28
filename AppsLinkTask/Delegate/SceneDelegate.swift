//
//  SceneDelegate.swift
//  AppsLinkTask
//
//  Created by Sherif Abd El-Moniem on 25/11/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        addUser()
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            rootNavigationController = UINavigationController()
            window.rootViewController = rootNavigationController
            //            let mainTabsView = MainTabsStoryboardRouter.instantiateMainTabsViewController()
            let loginView = LoginStoryboardRouter.instantiateLoginViewController()
            rootNavigationController?.pushViewController(loginView, animated: false)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    func sceneWillResignActive(_ scene: UIScene) {
    }
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}
extension SceneDelegate {
    func addUser(){
        let user = UserModel()
        user.organization = "company"
        user.username = "Ahmed"
        user.password = "123456"
        currentUser = user
    }
}
