//
//  ProfileViewController.swift
//  AppsLinkTask
//
//  Created by Sherif Abd El-Moniem on 28/11/2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profilePicture: UIImageView!
    
    let services = ProfileServices()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup()
        addCirclureEffectToImage()
        //        loadData()
    }
    func addCirclureEffectToImage(){
        self.profilePicture.layer.masksToBounds = true
        self.profilePicture.layer.cornerRadius = self.profilePicture.bounds.width / 2
    }
    
    @objc func backBtn () {
        navigationController?.popViewController(animated: true)
    }
    
    func navigationBarSetup () {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.backgroundColor = .clear
        button.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.addTarget(self, action:#selector(backBtn), for: .touchUpInside)
        NSLayoutConstraint.activate([button.widthAnchor.constraint(equalToConstant: 40) ,  button.heightAnchor.constraint(equalToConstant: 40)])
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItems = [barButton]
        let logo = UILabel()
        logo.text = "My Profile"
        self.navigationItem.titleView = logo
    }
    func loadData(){
        services.getUserProfile { response in
            // set responce to data model array
        } failure: {
            // show error message from Utilities showPopup
        }
    }
}
