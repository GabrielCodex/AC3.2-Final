//
//  AppDelegate.swift
//  AC3.2-Final
//
//  Created by Jason Gresh on 2/14/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FIRApp.configure()
        
//        let feedAndUploadTab = UITabBarController()
//        
//        let feedViewController = FeedViewController()
//        let uploadViewController = UploadViewController()
        let loginViewController = LoginViewController()
//        
//        //Embedding Nav Contoller
//        let feedNavigationController = UINavigationController(rootViewController: feedViewController)
//        let uploadNavigationControllerr = UINavigationController(rootViewController: uploadViewController)
//        
//        // Gathering up all the Viewcontrollers and connecting them to the tabs?
//        feedAndUploadTab.viewControllers = [feedNavigationController,uploadNavigationControllerr]
//        
//        // TabBar Images
//        feedViewController.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "chickenleg") , tag: 0)
//        uploadNavigationControllerr.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "upload"), tag: 1)
//        
//        // Upload Navigation Bar  Color and Text
//        uploadNavigationControllerr.navigationBar.barTintColor = UIColor.white
//        uploadNavigationControllerr.navigationBar.topItem?.title = "Unit6Final-StaGram"
//        // Feed Navigation Bar Color and Text
//        feedNavigationController.navigationBar.barTintColor = UIColor.white
//        feedNavigationController.navigationBar.topItem?.title = "Unit6Final-StaGram"
//        
//        //Not sure yet
//        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
//        
//        // Changes tabBar Color
//        feedAndUploadTab.tabBar.barTintColor = UIColor.white
        
        // What the fuck does the below do?
//                let navigationBar = UINavigationController()
//                navigationBar.setToolbarHidden(false, animated: false)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
       // self.window?.rootViewController = feedAndUploadTab
        self.window?.rootViewController = loginViewController
        self.window?.makeKeyAndVisible()
        
        
        // Override point for customization after application launch.
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
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
    }
    
    
}

