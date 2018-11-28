//
//  MenuHeaderView.swift
//  Store@Home
//
//  Created by MALAVIKA on 27/11/18.
//  Copyright © 2018 MALAVIKA. All rights reserved.
//

import UIKit

class MenuHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var addButtonTrailConstraint: NSLayoutConstraint!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    var canViewContents = false
    var section: Int = -1
    
    override func awakeFromNib() {
        
    }
    
    class func instanceFromNib() -> MenuHeaderView {
        let menuHeaderView = UINib(nibName: "MenuHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! MenuHeaderView
        return menuHeaderView
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
