//
//  StatusViewController.swift
//  AppsLinkTask
//
//  Created by Sherif Abd El-Moniem on 28/11/2021.
//

import UIKit

class StatusViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var confirmButton: RoundedButton!
    
let cellIdentifire = "StatusTableViewCell"
   
     let statusList: [String] = ["Busy", "In a meeting", "Available", "Urgent calls only" ]

     var statusString : String = ""
     var userPressedOnConfirmButton :((_ statusString : String)-> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: cellIdentifire, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifire)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    @IBAction func confirmButtonActoin(_ sender: Any) {
        userPressedOnConfirmButton?(statusString)
        self.dismiss(animated: true)

    }

}
extension StatusViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath) as? StatusTableViewCell {
            cell.setup(text: statusList[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < statusList.count {
            statusString = statusList[indexPath.row]
            userPressedOnConfirmButton?(statusString)
            self.dismiss(animated: true)
            }
        }
}
