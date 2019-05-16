//
//  AppDelegate.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 14/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool {

        // Change navigation bar tint color throughout the app
        UINavigationBar.appearance().barTintColor = UIColor(
            red: 15.0/255.0, green: 21.0/255.0, blue: 40.0/255.0, alpha: 1.0
        )

        // Change navigation bar item's color throughout the app
        UINavigationBar.appearance().tintColor = UIColor.white

        // Change navigation bar text color throughout the app
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]

        // Change navigation bar button's tint color throughout the app
        UIBarButtonItem.appearance().tintColor = UIColor.white
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) { }

    func applicationDidEnterBackground(_ application: UIApplication) { }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) { }

    func applicationWillTerminate(_ application: UIApplication) { }

}
