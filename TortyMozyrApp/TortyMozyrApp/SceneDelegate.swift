//
//  SceneDelegate.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 1.03.21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = scene as? UIWindowScene else { return }
        let window = UIWindow(frame: scene.coordinateSpace.bounds)
        window.windowScene = scene
        
        window.rootViewController = GreetingViewController()
        self.window = window
        window.makeKeyAndVisible()

        self.setUpNavBarAppearance()
    }

    // MARK: - navBar & navButtons configurations

    func setUpNavBarAppearance() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground()
        navBarAppearance.backgroundColor = UIColor(named: "AKBlue")
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white,
                                                .font: UIFont.systemFont(ofSize: 25, weight: .thin)]

        let buttonStyle = UIBarButtonItemAppearance(style: .plain)
        buttonStyle.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.buttonAppearance = buttonStyle
        navBarAppearance.doneButtonAppearance = buttonStyle

        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().tintColor = .white

    }


    func changeRootViewController(_ vc: UIViewController,
                                  animated: Bool = true,
                                  options: UIView.AnimationOptions) {
        guard let window = self.window else { return }

        window.rootViewController = vc

        if animated {
            UIView.transition(with: window,
                              duration: 0.5,
                              options: options,
                              animations: nil,
                              completion: nil)
        }
    }
}
