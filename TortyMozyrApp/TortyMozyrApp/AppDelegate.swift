//
//  AppDelegate.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 1.03.21.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil {

            }
        }
        return true
    }
    
//    func showGreetingVC() {
//        let greetingVC = AuthViewController()
//        greetingVC.modalPresentationStyle = .fullScreen
//        self.window?.rootViewController?.present(greetingVC, animated: true, completion: nil)
//    }
}

