//
//  ProfileStoryboardRouter.swift
//  AppsLinkTask
//
//  Created by Sherif Abd El-Moniem on 28/11/2021.
//

import Foundation
import UIKit

class ProfileStoryboardRouter {
    
    private static func getStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Profile", bundle: nil)
    }
    
    static func instantiateProfileViewController () -> ProfileViewController {
        if let profileViewController: ProfileViewController = getStoryboard().instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController {
            return profileViewController
        } else {
            return ProfileViewController()
        }
    }
}
