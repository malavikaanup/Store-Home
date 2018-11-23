//
//  Globals.swift
//  Store@Home
//
//  Created by MALAVIKA on 22/11/18.
//  Copyright © 2018 MALAVIKA. All rights reserved.
//

import UIKit

class Globals: NSObject {

    class func isConnectedToInternet(parentController: UIViewController) -> Bool {
        var reachable = true
        NetworkManager.isUnreachable { _ in
            self.showAlertWithText(message: Message.Offline, viewController: parentController)
            reachable = false
        }
        return reachable
    }
    
    class func previousViewController(navController: UINavigationController) -> UIViewController?{
        let length = navController.viewControllers.count
        let previousViewController: UIViewController? = length >= 2 ? navController.viewControllers[length-2] : nil
        return previousViewController
    }
    
    class func showAlertWithText(message: String, viewController: UIViewController) {
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (okAction) in
            return
        }
        alert.addAction(okAction)
        viewController.present(alert, animated: true) {
            return
        }
    }
    
    class func showActivityIndicatory(uiView: UIView) {
        let container: UIView   = UIView()
        container.frame         = uiView.frame
        container.center        = uiView.center
        container.tag           = 1000
        container.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        
        let loadingView: UIView     = UIView()
        loadingView.frame           = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
        loadingView.center          = uiView.center
        loadingView.backgroundColor = UIColor(red: 68/255, green: 68/255, blue: 68/255, alpha: 1.0)
        loadingView.clipsToBounds   = true
        loadingView.layer.cornerRadius = 10
        
        let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        actInd.frame                        = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        actInd.activityIndicatorViewStyle   = UIActivityIndicatorViewStyle.whiteLarge
        actInd.center                       = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        
        loadingView.addSubview(actInd)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        actInd.startAnimating()
    }
    
    class func hideActivityIndicator(uiView: UIView) {
        let container = uiView.viewWithTag(1000)
        container?.removeFromSuperview()
    }
    
    class func showAlertWithHandler(title: String, message: String, cancelButton: Bool, viewController: UIViewController, completion data: @escaping getCompletion) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (_ action: UIAlertAction) -> Void in
            data()
        }
        alert.addAction(ok)
        if cancelButton {
            let cancel = UIAlertAction(title: "CANCEL", style: UIAlertActionStyle.default) { (cancelAction) in
                return
            }
            alert.addAction(cancel)
        }
        viewController.present(alert, animated: true) {
            return
        }
    }
    
    func isValidEmail(email: String) -> Bool {
        var returnValue = false
        let emailRegEx = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        returnValue = emailTest.evaluate(with: email)
        
        return  returnValue
    }

    func trimmedText(string: String) -> String {
        return string.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
    }
}
