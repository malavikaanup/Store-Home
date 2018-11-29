//
//  HomeViewController.swift
//  Store@Home
//
//  Created by MALAVIKA on 26/11/18.
//  Copyright © 2018 MALAVIKA. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, ShowupViewControllersDelegate {

    @IBOutlet weak var revealButtonItem: UIButton!
    var menuVC: SideMenuViewController = SideMenuViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let revealVC = revealViewController() as SWRevealViewController
        revealButtonItem.addTarget(revealVC, action: #selector(revealVC.revealToggle(_:)), for: UIControlEvents.touchUpInside)
        
        menuVC = (revealVC.rearViewController! as! UINavigationController).topViewController as! SideMenuViewController
        menuVC.vcDelegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    func moveToProfileView() {
        self.tabBarController?.selectedIndex = 0
        performSegue(withIdentifier: "pushSeguetoProfile", sender: self)
        let revealVC = revealViewController() as SWRevealViewController
        revealVC.revealToggle(self)
    }
    
    
    @IBAction func onClickProfileButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "pushSeguetoProfile", sender: self)
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
