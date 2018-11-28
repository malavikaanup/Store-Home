//
//  LoginSignupViewController.swift
//  Store@Home
//
//  Created by MALAVIKA on 23/11/18.
//  Copyright © 2018 MALAVIKA. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn


class LoginSignupViewController: UIViewController, GIDSignInUIDelegate {
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var signupView: UIView!
    @IBOutlet weak var loginEmailTextField: FloatLabelTextField!
    @IBOutlet weak var loginPasswordTextField: FloatLabelTextField!
    @IBOutlet weak var firstNameTextField: FloatLabelTextField!
    @IBOutlet weak var lastNameTextField: FloatLabelTextField!
    @IBOutlet weak var emailTextField: FloatLabelTextField!
    @IBOutlet weak var passwordTextField: FloatLabelTextField!
    @IBOutlet weak var refcodeTextField: FloatLabelTextField!
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    var dict: [String: AnyObject]!
    var selectedSegment: Int = 0
    var fromSideMenu: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainScrollView.contentSize = contentView.frame.size
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(onSuccessSignIn(_:)), name: NSNotification.Name(rawValue: "GoogleSignIn"), object: nil)
        
        if fromSideMenu {
            segmentControl.selectedSegmentIndex = selectedSegment
            self.changeSegmentValue(value: selectedSegment)
        }
        // Do any additional setup after loading the view.
    }
    
    @objc func onSuccessSignIn(_ notification: Notification) -> Void {
        print(notification.userInfo as Any)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        mainScrollView.contentSize = contentView.frame.size
    }

    @IBAction func onClickClose(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onChangeSegmentValue(_ sender: UISegmentedControl) {
        self.changeSegmentValue(value: sender.selectedSegmentIndex)
    }
    
    func changeSegmentValue(value: Int) {
        if value == 0 {
            loginView.isHidden = false
            signupView.isHidden = true
        } else {
            signupView.isHidden = false
            loginView.isHidden = true
        }
    }
    
    @IBAction func onClickFB(_ sender: UIButton) {
        FBSDKLoginManager().logIn(withReadPermissions: ["public_profile", "email"], from: self) { (loginResult, error) in
            
            if let err = error {
                print(err)
            } else if (loginResult?.isCancelled)! {
                print("Login cancelled")
            } else {
                print(loginResult?.grantedPermissions as Any)
                print(loginResult?.declinedPermissions as Any)
                self.getFbUserData()
            }
        }
    }
    
    func getFbUserData() {
        if FBSDKAccessToken.current() != nil {
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, email, picture.type(large)"]).start { (connection, result, error) -> Void in
                if error == nil {
                    self.dict = result as! [String: AnyObject]
                    print(result as Any)
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func onClickGooglePlus(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBAction func onClickForgotPassword(_ sender: UIButton) {
        if loginEmailTextField.text?.count == 0 {
            Globals.showAlertWithText(message: "Please enter email id. \n We will send an OTP to the resgistered mobile number and email id", viewController: self)
        } else {
            self.performSegue(withIdentifier: "pushSegueToOTP", sender: sender)
        }
        
    }
    
    @IBAction func onClickOTPLogin(_ sender: UIButton) {
        if loginEmailTextField.text?.count == 0 {
            Globals.showAlertWithText(message: "Please enter email id. \n We will send an OTP to the resgistered mobile number and email id", viewController: self)
        } else {
            self.performSegue(withIdentifier: "pushSegueToOTP", sender: sender)
        }
    }
    
    @IBAction func onClickLoginButton(_ sender: UIButton) {
        onClickClose(sender)
    }
    @IBAction func onClickShowButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        passwordTextField.isSecureTextEntry = sender.isSelected ? false : true
    }
    
    @IBAction func onClickInfoButton(_ sender: UIButton) {
        Globals.showAlertWithText(message: "Accept your friend's invite by entering referral code and earn free credits", viewController: self)
    }
    
    @IBAction func onClickSignupButton(_ sender: UIButton) {
        onClickClose(sender)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let otpLoginVC = segue.destination as! ForgotPasswordOTPLoginViewController
        otpLoginVC.otpViewTag = (sender as! UIButton).tag == 11 ? ViewTags.forgotPassword : ViewTags.otpLogin
    }
 

}
