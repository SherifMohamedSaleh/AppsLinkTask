//
//  LoginStoryboardRouter.swift
//  AppsLinkTask
//
//  Created by Sherif Abd El-Moniem on 25/11/2021.
//

import UIKit

class LoginStoryboardRouter {
    
    private static func getStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Login", bundle: nil)
    }
    
    static func instantiateLoginViewController () -> LoginViewController {
        if let loginViewController: LoginViewController = getStoryboard().instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            return loginViewController
        } else {
            return LoginViewController()
        }
    }
}

