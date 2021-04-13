//
//  TMTabBarViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 6.03.21.
//

import UIKit

class TMTabBarViewController: UITabBarController {

    // MARK: - app life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: - tab bar configuration

        let homepageController = TMHomepageViewController()
        homepageController.tabBarItem = UITabBarItem(title: "Главная",
                                                     image: UIImage(systemName: "house.circle"),
                                                     selectedImage: UIImage(systemName: "house.circle.fill"))

        let menuController = TMMainMenuViewController()
        menuController.tabBarItem = UITabBarItem(title: "Меню",
                                                 image: UIImage(systemName: "line.horizontal.3.circle"),
                                                 selectedImage: UIImage(systemName: "line.horizontal.3.circle.fill"))

        let deliveryController = TMDeliveryViewController()
        deliveryController.tabBarItem = UITabBarItem(title: "Доставка",
                                                     image: UIImage(systemName: "car.circle"),
                                                     selectedImage: UIImage(systemName: "car.circle.fill"))

        let basketController = TMBasketViewController()
        basketController.tabBarItem = UITabBarItem(title: "Корзина",
                                                   image: UIImage(systemName: "cart.circle"),
                                                   selectedImage: UIImage(systemName: "cart.circle.fill"))

        let moreController = TMMoreViewController()
        moreController.tabBarItem = UITabBarItem(title: "Ещё",
                                                 image: UIImage(systemName: "ellipsis.circle"),
                                                 selectedImage: UIImage(systemName: "ellipsis.circle.fill"))

        self.setViewControllers([
            UINavigationController(rootViewController: homepageController),
            UINavigationController(rootViewController: menuController),
            UINavigationController(rootViewController: deliveryController),
            UINavigationController(rootViewController: basketController),
            UINavigationController(rootViewController: moreController)
        ], animated: true)

        self.setTabBarAppearance()
    }

    func setTabBarAppearance() {
        self.tabBar.barTintColor = UIColor(named: "AKWhite")
        self.tabBar.tintColor = UIColor(named: "AKBlue")
        self.tabBar.unselectedItemTintColor = UIColor(named: "AKLightGray")
        self.tabBar.itemPositioning = .automatic
        //        self.tabBar.isTranslucent = true

        // Tab Bar Shadow configure
        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: -5)
        self.tabBar.layer.shadowRadius = 5
        self.tabBar.layer.shadowOpacity = 0.2
        self.tabBar.layer.shadowColor = UIColor(named: "AKBlue")?.cgColor
    }

    // MARK: - tab bar icons animation
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let index = self.tabBar.items?.firstIndex(of: item),
              let imageView = tabBar.subviews[index + 1].subviews.first as? UIImageView else { return }

        UIView.animate(withDuration: 0.5,
                       delay: 0, // задержка перед анимацией
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseInOut) {

            imageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)

            UIView.animate(withDuration: 0.5,
                           delay: 0.2, // задержка перед анимацией
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0.5,
                           options: .curveEaseInOut) {
                imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
                       }
    }

}
