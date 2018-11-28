//
//  SideMenuTableViewCell.swift
//  Store@Home
//
//  Created by MALAVIKA on 26/11/18.
//  Copyright © 2018 MALAVIKA. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    @IBOutlet weak var cellLabelLeadConstraint: NSLayoutConstraint!
    @IBOutlet weak var cellArrowTrailConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
