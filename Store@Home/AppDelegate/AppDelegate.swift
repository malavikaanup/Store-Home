//
//  AppDelegate.swift
//  Store@Home
//
//  Created by MALAVIKA on 22/11/18.
//  Copyright © 2018 MALAVIKA. All rights reserved.
//

import UIKit
import CoreData
import FBSDKLoginKit
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    var window: UIWindow?

    var userDict: [String: String]!
        
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        GIDSignIn.sharedInstance().clientID = GPLUS_CLIENTID
        GIDSignIn.sharedInstance().delegate = self
        
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        let barButtonItemAppearance = UIBarButtonItem.appearance()
        barButtonItemAppearance.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.clear], for: .normal)
        barButtonItemAppearance.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.clear], for: .highlighted)
        let backImg: UIImage = UIImage(imageLiteralResourceName: "back_button")
        barButtonItemAppearance.setBackButtonBackgroundImage(backImg, for: .normal, barMetrics: .default)
        
        let image = UIImage()
        
        UINavigationBar.appearance().backIndicatorImage = image
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = image
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        
        FBSDKAppEvents.activateApp()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        print(app)
        print(url)
        
        return GIDSignIn.sharedInstance().handle(url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String, annotation: options[UIApplicationOpenURLOptionsKey.annotation] as Any)
        
        return FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String, annotation: options[UIApplicationOpenURLOptionsKey.annotation] as Any)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let err = error {
            print(err.localizedDescription)
        } else {
            let userId = user.userID
            let email = user.profile.email
            let idToken = user.authentication.accessToken
            let familyName = user.profile.familyName
            let givenName = user.profile.givenName
            let fullName = user.profile.name
            var url = ""
            if user.profile.hasImage {
                url = user.profile.imageURL(withDimension: 80).absoluteString
            }
            userDict = ["userID":userId, "token": idToken, "email": email, "familyName": familyName, "givenName": givenName, "fullName": fullName, "imageURL": url] as! [String : String]
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "GoogleSignIn"), object: nil, userInfo:nil)
            
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        print(error.localizedDescription)
    }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Store_Home")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

