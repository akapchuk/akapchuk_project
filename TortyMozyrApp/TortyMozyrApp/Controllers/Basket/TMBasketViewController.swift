//
//  TMBasketViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 6.03.21.
//

import UIKit

class TMBasketViewController: UIViewController {

    // MARK: - gui variables

    private lazy var basketHeaderTitleLabel: AKHeaderTitleLabel = {
        let header = AKHeaderTitleLabel()
        header.text = "Корзина"
        return header
    }()


    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "AKWhite")

        self.title = "Корзина"

        self.view.addSubview(basketHeaderTitleLabel)

        self.setUpConstraints()
    }

    // MARK: - set up constraints

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.basketHeaderTitleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.basketHeaderTitleLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 20)
        ])
    }

    // MARK: - actions
}
