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

let alertTitle = "Store@Home"

struct AppColor {
    
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
