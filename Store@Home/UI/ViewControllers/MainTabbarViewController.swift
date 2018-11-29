//
//  MainTabbarViewController.swift
//  Store@Home
//
//  Created by MALAVIKA on 25/11/18.
//  Copyright © 2018 MALAVIKA. All rights reserved.
//

import UIKit

class MainTabbarViewController: UITabBarController, ShowupTabViewControllersDelegate {    
    
    var menuVC: SideMenuViewController = SideMenuViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuVC = (self.revealViewController().rearViewController! as! UINavigationController).topViewController as! SideMenuViewController
        menuVC.tabVCDelagte = self
        
        // Do any additional setup after loading the view.
    }
    
    func moveToSelectedTab(index: Int) {
        switch index {
        case 0:
            self.selectedIndex = 0
        case 3:
            self.selectedIndex = 3
        default:
            self.selectedIndex = 0
        }
        let revealVC = revealViewController() as SWRevealViewController
        revealVC.revealToggle(self)
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
