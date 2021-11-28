//
//  HomeStoryboardRouter.swift
//  AppsLinkTask
//
//  Created by Sherif Abd El-Moniem on 25/11/2021.
//

import Foundation
import UIKit



class HomeStoryboardRouter {
    
    private static func getStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Home", bundle: nil)
    }
    
    static func instantiateStatusViewController () -> StatusViewController {
        if let statusViewController: StatusViewController = getStoryboard().instantiateViewController(withIdentifier: "StatusViewController") as? StatusViewController {
            return statusViewController
        } else {
            return StatusViewController()
        }
    }
}

