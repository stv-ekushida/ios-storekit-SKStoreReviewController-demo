//
//  AppDelegate.swift
//  ios-storekit-SKStoreReviewController-demo
//
//  Created by Eiji Kushida on 2018/06/08.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        LaunchManager.countUpLaunchTimes()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }
        
    func applicationWillTerminate(_ application: UIApplication) {
    }
}
