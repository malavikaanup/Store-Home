//
//  ForgotPasswordOTPLoginViewController.swift
//  Store@Home
//
//  Created by MALAVIKA on 24/11/18.
//  Copyright © 2018 MALAVIKA. All rights reserved.
//

import UIKit

class ForgotPasswordOTPLoginViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var confirmPasswordTextField: FloatLabelTextField!
    @IBOutlet weak var newPasswordTextField: FloatLabelTextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var resendButton: UIButton!
    @IBOutlet weak var updateButton: UIButton!
    
    @IBOutlet weak var digit1TextField: UITextField!
    @IBOutlet weak var digit2TextField: UITextField!
    @IBOutlet weak var digit6TextField: UITextField!
    @IBOutlet weak var digit5TextField: UITextField!
    @IBOutlet weak var digit4TextField: UITextField!
    @IBOutlet weak var digit3TextField: UITextField!
    
    var otpViewTag:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resendButton.layer.cornerRadius = 3.0
        resendButton.layer.borderWidth = 1.0
        resendButton.layer.borderColor = AppColor.grayBorderColor.cgColor
        
        updateButton.layer.borderColor = AppColor.orangeColor.cgColor
        updateButton.layer.borderWidth = 1.0
        updateButton.layer.cornerRadius = 3.0
        
        switch otpViewTag {
            case ViewTags.otpLogin:
                loginButton.isHidden = false
                passwordView.isHidden = true
                titleLabel.text = "Login With OTP"
            case ViewTags.forgotPassword:
                loginButton.isHidden = true
                passwordView.isHidden = false
                titleLabel.text = "Forgot Password?"
            default:
                loginButton.isHidden = false
                passwordView.isHidden = true
                titleLabel.text = "Login With OTP"
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickresendOTP(_ sender: UIButton) {
    }
    
    @IBAction func onClickNewShow(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        newPasswordTextField.isSecureTextEntry = sender.isSelected ? false : true
    }
    
    @IBAction func onClickConfirmShow(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        confirmPasswordTextField.isSecureTextEntry = sender.isSelected ? false : true
    }
    
    @IBAction func onClickOTPLogin(_ sender: UIButton) {
        self.navigationController?.dismiss(animated: true, completion: {
            self.navigationController?.popViewController(animated: true)
        })
    }
    
    @IBAction func updatePassword(_ sender: UIButton) {
        self.navigationController?.dismiss(animated: true, completion: {
            self.navigationController?.popViewController(animated: true)
        })
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
