//
//  AppDelegate.swift
//  BaseProject
//
//  Created by 杨西川 on 11/08/2017.
//  Copyright © 2017 杨西川. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static let shared = AppDelegate()
    var tabBarController = MainTabBarController()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        //设置根控制器
        buildKeyWindow()
        
        //全局设置
        gloablPreferences()
        return true
    }
    
    public func buildKeyWindow() {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        initHomeVC()
        window!.makeKeyAndVisible()
        
        //let isNotFristOpen = UserDefaults.standard.bool(forKey: kIsNotFirstLaunch)
        //if isNotFristOpen {
        //    initHomeVC()
        //} else {
        //    window!.rootViewController   = GuideViewController()
        //}
    }
    
    public func initHomeVC() {
        tabBarController = MainTabBarController()
        window!.rootViewController = tabBarController
    }
    
    func gloablPreferences() {
        
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

