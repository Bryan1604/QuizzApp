//
//  AppDelegate.swift
//  QuizApp
//
//  Created by ZYYX Intern on 30/01/2023.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UserDefaults.standard.register(defaults: ["showTutorial" : true])
        IQKeyboardManager.shared.enable = true

//        IQKeyboardManager.sharedManager().enable = true   // kich hoat IQKeyboardManager
//        IQKeyboardManager.sharedManager().previousNextDisplayMode = IQPreviousNextDisplayMode.Default  // icon button previous/next/done tren toolbar
//        IQKeyboardManager.sharedManager().shouldShowToolbarPlaceholder = false // placeholder trong textField's
//        IQKeyboardManager.sharedManager().shouldResignOnTouchOutside = true  // tap ben ngoai ban phim se thoat khoi textField's
//        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "OK"  // text button Done
//        IQKeyboardManager.shared.enableDebugging = true  //  enableDebugging = true
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

