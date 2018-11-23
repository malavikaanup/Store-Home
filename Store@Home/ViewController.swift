//
//  ViewController.swift
//  Store@Home
//
//  Created by MALAVIKA on 22/11/18.
//  Copyright © 2018 MALAVIKA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var firstTime = true
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        if firstTime {
            let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginSignupVC") as! LoginSignupViewController
            present(loginVC, animated: true) {
                self.firstTime = false
            }
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

