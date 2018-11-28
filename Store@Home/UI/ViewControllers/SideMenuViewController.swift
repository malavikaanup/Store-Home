//
//  SideMenuViewController.swift
//  Store@Home
//
//  Created by MALAVIKA on 25/11/18.
//  Copyright © 2018 MALAVIKA. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var guestMenuTableView: UITableView!
    @IBOutlet weak var detailsViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var expdeliveryImageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var expdeliveryLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var signupTrailConstraint: NSLayoutConstraint!
    @IBOutlet weak var editTrailConstraint: NSLayoutConstraint!
    @IBOutlet weak var expdeliveryLabel: UILabel!
    @IBOutlet weak var deliveryTimeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var topViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    var loggedIn = false
    var accountContents = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Globals.changeButtonAppearance(button: loginButton, color: UIColor.white)
        Globals.changeButtonAppearance(button: signupButton, color: UIColor.white)
        
        let rearWidth = self.revealViewController().rearViewRevealWidth
        let trailConstant = screenWidth - rearWidth
        editTrailConstraint.constant = editTrailConstraint.constant + trailConstant
        signupTrailConstraint.constant = signupTrailConstraint.constant + trailConstant
        self.view.layoutIfNeeded()
        
        let nib = UINib(nibName: "MenuHeaderView", bundle: nil)
        menuTableView.register(nib, forHeaderFooterViewReuseIdentifier: "menuHeaderID")
        
        // Do any additional setup after loading the view.
    }
    
    func prepareContentsofAccount() {
        accountContents = ["My Orders", "My Wallet", "Third-party Payment Wallets", "Pay Now for Orders", "My Profile", "Change Password", "Delivery Address", "Logout"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        changeUIOnLogin()
    }
    
    func changeUIOnLogin() {
        loginButton.isHidden        = loggedIn
        signupButton.isHidden       = loggedIn
        userNameLabel.isHidden      = !loggedIn
        menuTableView.isHidden      = !loggedIn
        guestMenuTableView.isHidden = loggedIn
    }
    
    @objc func revealSectionContents(_ sender: Any) {
        
        var section = -1
        var addButton = UIButton()
        if sender is UIButton {
            addButton = sender as! UIButton
            
        } else if sender is UITapGestureRecognizer {
            let header = ((sender as! UITapGestureRecognizer).view) as! MenuHeaderView
            addButton = header.addButton
        }
        
        var indexPaths = [IndexPath]()
        for row in 0...7 {
            let indexPath = IndexPath(row: row, section: 1)
            indexPaths.append(indexPath)
        }
        
        if addButton.isSelected {
            accountContents.removeAll()
            menuTableView.deleteRows(at: indexPaths, with: UITableViewRowAnimation.none)
        } else {
            prepareContentsofAccount()
            menuTableView.insertRows(at: indexPaths, with: UITableViewRowAnimation.none)
        }
        addButton.isSelected = !addButton.isSelected
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == menuTableView {
            return 3
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == menuTableView {
            switch section {
            case 1:
                return accountContents.count
            case 2:
                return 10
            default:
                return 1
            }
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 1 ? 60.0 : 0.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let headerView = MenuHeaderView.instanceFromNib()
            headerView.frame = CGRect(x: 0.0, y: 0.0, width: tableView.frame.size.width, height: 60.0)
            headerView.sectionLabel.text = "My Account"
            headerView.addButton.addTarget(self, action: #selector(revealSectionContents(_:)), for: UIControlEvents.touchUpInside)
            let tapGest = UITapGestureRecognizer(target: self, action: #selector(revealSectionContents(_:)))
            tapGest.numberOfTapsRequired = 1
            headerView.addGestureRecognizer(tapGest)
            headerView.section = section
            headerView.addButton.isSelected = accountContents.count == 0 ? false : true
            let rearWidth = self.revealViewController().rearViewRevealWidth
            headerView.addButtonTrailConstraint.constant = (screenWidth - rearWidth) + 20.0
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = tableView == menuTableView ? "menuCell" : "guestmenuCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! SideMenuTableViewCell
        let rearWidth = self.revealViewController().rearViewRevealWidth
        cell.cellArrowTrailConstraint.constant = (screenWidth - rearWidth) + 20.0
        cell.titleLabel.font      = UIFont(name: "HelveticaNeue", size: 17.0)
        cell.titleLabel.textColor = UIColor.black
        cell.arrowImageView.isHidden = true
        var titleText = ""
        if tableView == guestMenuTableView {
            switch indexPath.row {
            case 1:
                titleText = "Smart Basket"
            case 2:
                titleText = "Shop by Category"
                cell.titleLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 17.0)
                cell.arrowImageView.isHidden = false
            case 3:
                titleText = "Offers"
            case 4:
                titleText = "Gift Cards"
            case 5:
                titleText = "bb Cookbook"
            case 6:
                titleText = "bb Lifestyle"
            case 7:
                titleText = "Customer Service"
            case 8:
                titleText = "Notifications"
            case 9:
                titleText = "FAQs"
            default:
                titleText = "Home"
            }
        } else {
            cell.cellLabelLeadConstraint.constant = 20.0
            switch indexPath.section {
            case 1:
                cell.titleLabel.font                  = UIFont(name: "HelveticaNeue", size: 15.0)
                cell.titleLabel.textColor             = AppColor.grayBorderColor
                cell.cellLabelLeadConstraint.constant = 30.0
                titleText = accountContents[indexPath.row]
                
            case 2:
                switch indexPath.row {
                case 1:
                    titleText = "Smart Basket"
                case 2:
                    titleText = "Shop by Category"
                    cell.titleLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 17.0)
                    cell.arrowImageView.isHidden = false
                case 3:
                    titleText = "Offers"
                case 4:
                    titleText = "Gift Cards"
                case 5:
                    titleText = "bb Cookbook"
                case 6:
                    titleText = "bb Lifestyle"
                case 7:
                    titleText = "Customer Service"
                case 8:
                    titleText = "Notifications"
                case 9:
                    titleText = "FAQs"
                default:
                    titleText = "Refer & Earn"
                }
            default:
                titleText = "Home"
            }
        }
        cell.titleLabel.text = titleText
        return cell 
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
           if indexPath.row == 7 {
                self.loggedIn = false
                self.changeUIOnLogin()
            }
        } else {
            if indexPath.row == 2 {
                performSegue(withIdentifier: "pushSeguetoSubmenu", sender: self)
            }
        }
    }
    
    

    @IBAction func onClickLoginButton(_ sender: UIButton) {
        loggedIn = true
        showupLoginSign(selectedValue: 0)
    }
    
    @IBAction func onClickSignupButton(_ sender: UIButton) {
        loggedIn = true
        showupLoginSign(selectedValue: 1)
    }
    
    func showupLoginSign(selectedValue: Int) {
        let loginNavVC = storyboard?.instantiateViewController(withIdentifier: "LoginSignupNavVC") as! UINavigationController
        let loginVC = loginNavVC.topViewController as! LoginSignupViewController
        loginVC.selectedSegment = selectedValue
        loginVC.fromSideMenu = true
        present(loginNavVC, animated: true, completion: nil)
    }
    
    
    @IBAction func onClickEditButton(_ sender: UIButton) {
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
