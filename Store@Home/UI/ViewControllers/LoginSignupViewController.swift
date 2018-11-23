//
//  LoginSignupViewController.swift
//  Store@Home
//
//  Created by MALAVIKA on 23/11/18.
//  Copyright © 2018 MALAVIKA. All rights reserved.
//

import UIKit

class LoginSignupViewController: UIViewController {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainScrollView.contentSize = contentView.frame.size
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        mainScrollView.contentSize = contentView.frame.size
    }

    @IBAction func onClickClose(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onChangeSegmentValue(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            loginView.isHidden = false
            signupView.isHidden = true
        } else {
            signupView.isHidden = false
            loginView.isHidden = true
        }
    }
    
    @IBAction func onClickFB(_ sender: UIButton) {
        
    }
    
    @IBAction func onClickGooglePlus(_ sender: UIButton) {
        
    }
    
    @IBAction func onClickForgotPassword(_ sender: UIButton) {
        
    }
    
    @IBAction func onClickOTPLogin(_ sender: UIButton) {
        
    }
    
    @IBAction func onClickLoginButton(_ sender: UIButton) {
        onClickClose(sender)
    }
    @IBAction func onClickShowButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        passwordTextField.isSecureTextEntry = sender.isSelected ? false : true
    }
    
    @IBAction func onClickInfoButton(_ sender: UIButton) {
    }
    
    @IBAction func onClickSignupButton(_ sender: UIButton) {
        onClickClose(sender)
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
