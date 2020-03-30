//
//  AppDelegate.swift
//  Covid19 Data
//
//  Created by Syed Ahmed on 2020-03-25.
//  Copyright © 2020 Syed Ahmed. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//        var initialViewController: UIViewController
//
//        if UserDefaults.standard.bool(forKey: "onboardingComplete") == true {
//            print(UserDefaults.standard.bool(forKey: "onboardingComplete"))
//            initialViewController = storyboard.instantiateViewController(identifier: "HomeVC") as TableViewController
//            //initialViewController = storyboard.instantiateInitialViewController()!
//        } else {
//            print("OnboardingComplete? - ", UserDefaults.standard.bool(forKey: "onboardingComplete"))
//            initialViewController = storyboard.instantiateViewController(identifier: "OnboardingVC") as OnboardingViewController
//        }
//
//        self.window?.rootViewController = initialViewController
//        self.window?.makeKeyAndVisible()
        
        let pageControl = UIPageControl.appearance()
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .gray
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

