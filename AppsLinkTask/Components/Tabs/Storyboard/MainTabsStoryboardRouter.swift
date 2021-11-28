//
//  MainTabsStoryboardRouter.swift
//  AppsLinkTask
//
//  Created by Sherif Abd El-Moniem on 25/11/2021.
//

import Foundation
import UIKit

class MainTabsStoryboardRouter {
    
    private static func getStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "MainTabs", bundle: nil)
    }
    
    static func instantiateMainTabsViewController () -> MainTabsViewController {
        if let mainTabsViewController: MainTabsViewController = getStoryboard().instantiateViewController(withIdentifier: "MainTabsViewController") as? MainTabsViewController {
            return mainTabsViewController
        } else {
            return MainTabsViewController()
        }
    }
}

