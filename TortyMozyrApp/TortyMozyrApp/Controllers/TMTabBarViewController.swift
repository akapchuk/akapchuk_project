//
//  TMTabBarViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 6.03.21.
//

import UIKit

class TMTabBarViewController: UITabBarController {

    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: - tab bar configuration

        let homepageController = TMHomepageViewController()
        homepageController.tabBarItem = UITabBarItem(title: "Homepage".localized,
                                                     image: UIImage(systemName: "house.circle"),
                                                     selectedImage: UIImage(systemName: "house.circle.fill"))

        let menuController = TMMainMenuViewController()
        menuController.tabBarItem = UITabBarItem(title: "Menu".localized,
                                                 image: UIImage(systemName: "line.horizontal.3.circle"),
                                                 selectedImage: UIImage(systemName: "line.horizontal.3.circle.fill"))

        let deliveryController = TMDeliveryVC()
        deliveryController.tabBarItem = UITabBarItem(title: "Delivery".localized,
                                                     image: UIImage(systemName: "car.circle"),
                                                     selectedImage: UIImage(systemName: "car.circle.fill"))

        let basketController = TMBasketViewController()
        basketController.tabBarItem = UITabBarItem(title: "Basket".localized,
                                                   image: UIImage(systemName: "cart.circle"),
                                                   selectedImage: UIImage(systemName: "cart.circle.fill"))

        let moreController = TMMoreViewController()
        moreController.tabBarItem = UITabBarItem(title: "More".localized,
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
        self.tabBar.unselectedItemTintColor = AKColors.lightGray
        self.tabBar.barTintColor = AKColors.white
        self.tabBar.tintColor = AKColors.blue
        self.tabBar.layer.shadowColor = AKColors.blue?.cgColor
        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: -5)
        self.tabBar.layer.shadowRadius = 5
        self.tabBar.layer.shadowOpacity = 0.2
        self.tabBar.itemPositioning = .automatic
    }

    // MARK: - tab bar icons animation

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let index = self.tabBar.items?.firstIndex(of: item),
              let imageView = tabBar.subviews[index + 1].subviews.first as? UIImageView else { return }

        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseInOut) {

            imageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)

            UIView.animate(withDuration: 0.5,
                           delay: 0.2,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0.5,
                           options: .curveEaseInOut) {
                imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
                       }
    }

}
