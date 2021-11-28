//
//  AppDelegate.swift
//  AppsLinkTask
//
//  Created by Sherif Abd El-Moniem on 25/11/2021.
//

import UIKit

var rootNavigationController: UINavigationController?
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupScreens()
        addUser()
        return true
    }
    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}
extension AppDelegate {
    func setupScreens () {
        if #available(iOS 13, *) {}
        else {
            rootNavigationController = UINavigationController()
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = rootNavigationController
            let loginView = LoginStoryboardRouter.instantiateLoginViewController()
            //          let mainTabViewView = MainTabsStoryboardRouter.instantiateMainTabsViewController()
            rootNavigationController?.pushViewController(loginView, animated: false)
        }
    }
    func addUser(){
        let user = UserModel()
        user.organization = "company"
        user.username = "Ahmed"
        user.password = "123456"
        currentUser = user
    }
}



