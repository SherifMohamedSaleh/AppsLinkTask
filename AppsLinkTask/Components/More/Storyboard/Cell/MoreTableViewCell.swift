//
//  MoreTableViewCell.swift
//  AppsLinkTask
//
//  Created by Sherif Abd El-Moniem on 25/11/2021.
//

import UIKit

class MoreTableViewCell: UITableViewCell {

    @IBOutlet weak var settingsImageView: UIImageView!
    @IBOutlet weak var settingsTextLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup (text: String, image: String = "") {
        settingsTextLbl.text = text
           if !image.isEmpty {
               settingsImageView.image = UIImage(named: image)
           }
    }
    
}
