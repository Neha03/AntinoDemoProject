//
//  customCell.swift
//  Antino
//
//  Created by NEHA NARANG on 15/05/20.
//  Copyright © 2020 @narang. All rights reserved.
//

import UIKit

class customCell: UITableViewCell {
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var agelabel: UILabel!
    @IBOutlet var namelabel: UILabel!
    @IBOutlet var locationlabel: UILabel!
    @IBOutlet var cellView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
