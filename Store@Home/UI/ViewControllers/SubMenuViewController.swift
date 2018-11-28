//
//  SubMenuViewController.swift
//  Store@Home
//
//  Created by MALAVIKA on 25/11/18.
//  Copyright © 2018 MALAVIKA. All rights reserved.
//

import UIKit

class SubMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var menuDict = [String: [String]]()
    var titlesArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titlesArray = ["Fruits & Vegetables", "Foodgrains, Oil & Masala", "Bakery, Cakes & Dairy"]
        menuDict = ["Fruits & Vegetables": [], "Foodgrains, Oil & Masala": [], "Bakery, Cakes & Dairy":[]]
        let keys = menuDict.keys
        print(keys)
//        for i in 0..<keys.count {
//            print(keys[i])
//        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func revealSectionContents(_ sender: UIButton) {
        
    }
    
    @IBAction func onClickBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuDict.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        let menuKey = menuDict.keys[section] as String
//        let valueArray = menuDict[menuKey] as [String]
        return 10//valueArray
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = MenuHeaderView.instanceFromNib()
        headerView.frame = CGRect(x: 0.0, y: 0.0, width: tableView.frame.size.width, height: 60.0)
        return headerView   
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "submenuCell") as! SideMenuTableViewCell
        return cell
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
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
