//
//  TMDeliveryViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 6.03.21.
//

import UIKit

class TMDeliveryViewController: UIViewController {

    private lazy var leftTileView: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .white
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.layer.cornerRadius = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var leftTileImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "medovikCakeImage")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.layer.maskedCorners = [
            .layerMaxXMinYCorner,
            .layerMinXMinYCorner
        ]
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var itemTitleLabel: UILabel = {
        let title = UILabel()
        title.text = "Медовик"
        title.textColor = UIColor(named: "AKDarkGray")
        title.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        return title
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Доставка"

        self.view.backgroundColor = UIColor(named: "AKWhite")

        self.view.addSubview(leftTileView)
        self.leftTileView.addSubview(leftTileImageView)
        self.leftTileView.addSubview(itemTitleLabel)

        self.setUpConstraints()
    }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.leftTileView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.leftTileView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            self.leftTileView.widthAnchor.constraint(equalToConstant: 150),
            self.leftTileView.heightAnchor.constraint(equalToConstant: 210)
        ])

        NSLayoutConstraint.activate([
            self.leftTileImageView.topAnchor.constraint(equalTo: self.leftTileView.topAnchor),
            self.leftTileImageView.leftAnchor.constraint(equalTo: self.leftTileView.leftAnchor),
            self.leftTileImageView.rightAnchor.constraint(equalTo: self.leftTileView.rightAnchor),
            self.leftTileImageView.bottomAnchor.constraint(equalTo: self.leftTileView.bottomAnchor, constant: -115)
        ])

        NSLayoutConstraint.activate([
            self.itemTitleLabel.topAnchor.constraint(equalTo: self.leftTileImageView.bottomAnchor, constant: 5),
            self.itemTitleLabel.centerXAnchor.constraint(equalTo: self.leftTileImageView.centerXAnchor)
        ])
    }
}
