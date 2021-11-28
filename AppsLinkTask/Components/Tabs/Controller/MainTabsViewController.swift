//
//  MainTabsViewController.swift
//  AppsLinkTask
//
//  Created by Sherif Abd El-Moniem on 25/11/2021.
//

import UIKit
class MainTabsViewController: UITabBarController , UITabBarControllerDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBarShadow()
        setupTabBarItems()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func createTabBarShadow() {
        tabBar.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        tabBar.layer.shadowOpacity = 1
        let offset = CGSize(width: 0.0, height: -2.0)
        tabBar.layer.shadowOffset = offset
        tabBar.layer.borderColor = UIColor.clear.cgColor
        tabBar.layer.shadowRadius = 5
        tabBar.clipsToBounds = false
        tabBar.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.68)
    }
    
    private func setupTabBarItems() {
        guard let items = tabBar.items else { return }
        for item in items {
            item.title = ""
            item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
    }
}
