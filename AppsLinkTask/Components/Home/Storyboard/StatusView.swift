//
//  StatusView.swift
//  AppsLinkTask
//
//  Created by Sherif Abd El-Moniem on 28/11/2021.
//

import Foundation
import UIKit
import SwiftMessages



class StatusView : UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var confirmButton: RoundedButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    
let cellIdentifire = "StatusTableViewCell"
    
    let statusList: [String] = ["Busv", "In a meeting", "Available", "Urgent calls only" ]
    
     var statusString : String = ""
    private  var userPressedOnConfirmButton :((_ status : String)-> Void)?
    
    override func awakeFromNib() {
    }

    required init?(coder aDecoder:NSCoder) {
        super.init(coder:aDecoder)
        setupView()
    }

    override init(frame:CGRect) {
        super.init(frame:frame)

        setupView()

    }
    func setupView(){
        contentView = loadViewFromNib()
        contentView.frame = bounds
        self.addSubview(contentView)
    
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        let nib = UINib(nibName: cellIdentifire, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifire)
      
//        tableView.reloadData()
        
        
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "StatusView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    
//    func preview( confirmButtonTouched:((_ status : String)-> Void)? ){
//        self.userPressedOnConfirmButton = confirmButtonTouched
//    }
    
    @IBAction func confirmButtonActoin(_ sender: Any) {
        userPressedOnConfirmButton?(statusString)
        SwiftMessages.hide()

    }
}
extension StatusView : UITableViewDelegate, UITableViewDataSource {
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

}

