//
//  AppConstants.swift
//  Store@Home
//
//  Created by MALAVIKA on 22/11/18.
//  Copyright © 2018 MALAVIKA. All rights reserved.
//

import UIKit

typealias getCompletion = () -> Void

let LIVE_SERVER_URL = ""
let DEMO_SERVER_URL = ""

let DEMO = true

let SERVER_URL = DEMO ? DEMO_SERVER_URL : LIVE_SERVER_URL

let appdelegate = UIApplication.shared.delegate as! AppDelegate
let screenWidth = UIScreen.main.bounds.size.width

let alertTitle = "Store@Home"

let GPLUS_CLIENTID = "64679762157-os1qq4ehn7hgstgap6hctdtvc4br74kd.apps.googleusercontent.com"

struct AppColor {
    static let grayBorderColor = UIColor(red: 109.0/255.0, green: 109.0/255.0, blue: 109.0/255.0, alpha: 1.0)
    static let orangeColor = UIColor(red: 1.0, green: 118.0/255.0, blue: 59.0/255.0, alpha: 1.0)
}

struct ViewTags {
    static let otpLogin = 1
    static let forgotPassword = 2
}

struct Message {
    static let Offline  = "The Internet connection appears to be offline."
    static let Error    = "Internal Error"
}

struct ResponseErrorMessage {
    static let invalid      = "Invalid Response!"
    static let sessionOut   = "Current Session Expired!"
}

struct HttpMethod {
    static let post = "POST"
    static let get  = "GET"
    static let put  = "PUT"
}

class AppConstants: NSObject {


}
