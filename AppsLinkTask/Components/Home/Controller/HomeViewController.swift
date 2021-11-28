//
//  HomeViewController.swift
//  AppsLinkTask
//
//  Created by Sherif Abd El-Moniem on 25/11/2021.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var status_Button: UIButton!
    @IBOutlet var tableView: UITableView!
    
    let service = HomeServices()
    
    let cellIdentifire = "HomeTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addCirclerEffectToImage()
        setUpHomeTableView()
        //        loadData()
        
    }
    @IBAction func stutasButtonAction(_ sender: Any) {
        
        let status = HomeStoryboardRouter.instantiateStatusViewController()
        
        status.userPressedOnConfirmButton = { statusString in
            
            self.status_Button.setTitle(statusString, for: .normal)
        }
        self.navigationController?.present(status, animated: true)
        
        
        
        //        let view_status = StatusView()
        //        Utilities.showPopUpForView(view: view_status)
        
    }
    
    func setUpHomeTableView(){
        // register table view cell
        let nib = UINib(nibName: cellIdentifire, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifire)
        // set Section Height
        tableView.estimatedSectionHeaderHeight = 50
        // set delegates
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func addCirclerEffectToImage(){
        self.profilePicture.layer.masksToBounds = true
        self.profilePicture.layer.cornerRadius = self.profilePicture.bounds.width / 2
        
    }
    func loadData(){
        service.getAllTechnologies { response in
            // set responce to data model array
        } failure: {
            // show error message from Utilities showPopup
        }
    }
}

extension HomeViewController  : UITableViewDelegate, UITableViewDataSource {
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath) as? HomeTableViewCell {
            
            
            // add shadow
            cell.layer.shadowColor = UIColor.gray.cgColor
            cell.layer.shadowRadius = 0.5
            cell.layer.shadowOpacity = 0.5
            cell.layer.shadowOffset = CGSize(width: 1, height: 1)
            cell.layer.masksToBounds = false
            
            return cell
        }
        return UITableViewCell()
    }
    
    // method to run when table view cell is tapped

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < 3 {
            print("You tapped cell number \(indexPath.row).")
            }
        }
}
