//
//  MyProfileViewController.swift
//  Store@Home
//
//  Created by MALAVIKA on 28/11/18.
//  Copyright © 2018 MALAVIKA. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var userContactLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameLabel.text = "Malavika Akhilesh"
        userEmailLabel.text = "malavika.akhilesh@gmail.com"
        userContactLabel.text = "9895686992"
        addressLabel.text = "Gottigere\nBanglore - 560083"
        // Do any additional setup after loading the view.
    }

    @IBAction func onClickEditButton(_ sender: UIButton) {
    
    }
    
    @IBAction func onClickChangeButton(_ sender: UIButton) {
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell") as! SideMenuTableViewCell
        var title = ""
        var imageName = ""
        switch indexPath.row {
        case 1:
            title = "My Wallet"
            imageName = "wallet_icon"
        case 2:
            title = "Notifications"
            imageName = "notification_icon"
        case 3:
            title = "Refer & Earn"
            imageName = "location" // refer_icon
        case 4:
            title = "My Gift Cards"
            imageName = "gift-card_icon"
        case 5:
            title = "Change Password"
            imageName = "changepassword_icon"
        case 6:
            title = "My Delivery Addresses"
            imageName = "location"
        case 7:
            title = "Logout"
            imageName = "logout_icon"
        default:
            title = "My Orders"
            imageName = "location" //order_icon
        }
        cell.titleLabel.text = title
        cell.arrowImageView.image = UIImage(imageLiteralResourceName: imageName)
        return cell
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
