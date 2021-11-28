//
//  StatusTableViewCell.swift
//  AppsLinkTask
//
//  Created by Sherif Abd El-Moniem on 28/11/2021.
//

import UIKit

class StatusTableViewCell: UITableViewCell {

    
    @IBOutlet weak var stutus_Label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func setup (text: String ) {
        stutus_Label.text = text
    }

 
}
