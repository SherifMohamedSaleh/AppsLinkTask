//
//  LoginViewController.swift
//  AppsLinkTask
//
//  Created by Sherif Abd El-Moniem on 25/11/2021.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var organization_textField: UITextField!
    
    @IBOutlet weak var userName_textField: UITextField!
    
    @IBOutlet weak var password_textField: UITextField!
    
    @IBOutlet weak var showPassword_Button: UIButton!
     
    

    @IBOutlet weak var backGroundImageView: UIImageView!
    
    
    private var isSecureTextEntry = true

    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackgroundImageOverlay()
      
    }
    
    @IBAction func showPasswordPressed(_ sender: Any) {
        
        
 
        showPassword_Button.isSelected = !showPassword_Button.isSelected
        password_textField.isSecureTextEntry =  !showPassword_Button.isSelected
    }

    
    @IBAction func signInPressed(_ sender: Any) {
        
        // call network layer
        
        
        if let userOrganization = organization_textField.text , let username = userName_textField.text , let password = password_textField.text {
            if !userOrganization.isEmpty && !username.isEmpty && !password.isEmpty {
                if currentUser.organization == userOrganization && currentUser.username == username && currentUser.password == password {
                    // move to taps
                    
                    let TabsView = MainTabsStoryboardRouter.instantiateMainTabsViewController()
                    navigationController?.pushViewController(TabsView, animated: true)
                }else {
                    // error
                    Utilities.showPopup(message: "invalid user", type: .Sad, firstButtonTitle: "ok", firstButtonAction: nil ,secondButtonTitle: nil, secondButtonAction: nil)
                }
            }else {
                Utilities.showPopup(message: "Missing Data", type: .Sad, firstButtonTitle: "ok", firstButtonAction: nil ,secondButtonTitle: nil, secondButtonAction: nil)
                   // missing data
            }
            
        
//            var loginUser = UserModel()
//            loginUser.organization = userOrganization
//            loginUser.username = username
//            loginUser.password = password
        }
        

    }
    
    
    func addBackgroundImageOverlay(){
        let overlay: UIView = UIView(frame: CGRect(x: 0, y: 0,  width: self.view.frame.width, height: self.view.frame.height))
        overlay.backgroundColor = UIColor(red: 33/255, green: 77/255, blue: 140/255, alpha: 0.85)
        backGroundImageView.addSubview(overlay)
    }
}

extension LoginViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case organization_textField :
            self.userName_textField.becomeFirstResponder()
        case userName_textField :
            self.password_textField.becomeFirstResponder()
        case password_textField :
            self.signInPressed(UIButton())
        default:
            break
        }
        return true
    }
}
