//
//  AppDelegate.swift
//  QuizApp
//
//  Created by ZYYX Intern on 30/01/2023.
//

import UIKit
import IQKeyboardManagerSwift
import FacebookCore
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        UserDefaults.standard.register(defaults: ["showTutorial" : true])
        IQKeyboardManager.shared.enable = true

        GIDSignIn.sharedInstance().clientID = "102020865498-12jhfvtcn3almq934a3cvpv7p20i2eu7.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().restorePreviousSignIn()
        
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        ApplicationDelegate.shared.application(
            app,
            open: url,
            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
        )
        
        var handled: Bool
        handled = GIDSignIn.sharedInstance().handle(url)
        if handled {
            return true
        }
            return false
    }
    
    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication,
                     didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

extension AppDelegate: GIDSignInDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        }else{
            // change rootView
            let storyboard = UIStoryboard(name: "HomeViewController", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            let rootView = UINavigationController(rootViewController: vc)
            SceneDelegate.shared?.changeRootController(rootView)
        }
    }
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        //
    }
}

