//
//  CategoriesViewController.swift
//  Store@Home
//
//  Created by MALAVIKA on 26/11/18.
//  Copyright © 2018 MALAVIKA. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var revealButtonItem: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let revealVC = revealViewController() as SWRevealViewController
        revealButtonItem.addTarget(revealVC, action: #selector(revealVC.revealToggle(_:)), for: UIControlEvents.touchUpInside)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
