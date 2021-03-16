//
//  MedovikCakeViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 14.03.21.
//

import UIKit

class MedovikCakeViewController: UIViewController {

    // MARK: - gui variables

    private lazy var buttonBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var backButtonImageView: UIImageView = {
        let button = UIImageView()
        button.image = UIImage(systemName: "chevron.compact.left")
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var imageMaskView: UIView = {
        let mask = UIView()
        mask.backgroundColor = .orange
        mask.layer.cornerRadius = 40
        mask.layer.maskedCorners = [
            .layerMaxXMaxYCorner,
            .layerMinXMaxYCorner
        ]
        mask.translatesAutoresizingMaskIntoConstraints = false
        return mask
    }()

    private lazy var cakeImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "medovikCake")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 40
        image.layer.maskedCorners = [
            .layerMaxXMaxYCorner,
            .layerMinXMaxYCorner
        ]
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var headerTitleLabel: AKHeaderTitleLabel = {
        let header = AKHeaderTitleLabel()
        header.text = "Торт «‎Медовик‎»‎"
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()

    private lazy var addToBasketButton: AKSystemButton = {
        let button = AKSystemButton()
        button.setTitle("Добавить в корзину", for: UIControl.State())
        button.backgroundColor = UIColor(named: "AKOrange")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var subHeaderTitle: UILabel = {
        let subHeader = UILabel()
        subHeader.text = "Вес: 1,5 ... 2,5 кг"
        subHeader.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        subHeader.translatesAutoresizingMaskIntoConstraints = false
        return subHeader
    }()

    private var medovikPrice = 29.9

    // MARK: - vc life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "AKWhite")

        // navController settings
        self.title = "Медовик"
        self.navigationController?.navigationBar.isHidden = true

        self.view.addSubview(self.imageMaskView)
        self.imageMaskView.addSubview(self.cakeImageView)
        self.imageMaskView.addSubview(self.buttonBackgroundView)
        self.buttonBackgroundView.addSubview(backButtonImageView)
        self.view.addSubview(addToBasketButton)
        self.view.addSubview(headerTitleLabel)
        self.view.addSubview(subHeaderTitle)



        self.buttonBackgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backButtonTapped)))

        self.setUpConctraints()
    }

    // MARK: - set up constraints

    private func setUpConctraints() {
        NSLayoutConstraint.activate([
            self.imageMaskView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.imageMaskView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            self.imageMaskView.heightAnchor.constraint(equalToConstant: self.view.frame.size.height / 4)
        ])

        NSLayoutConstraint.activate([
            self.buttonBackgroundView.topAnchor.constraint(equalTo: self.imageMaskView.topAnchor, constant: 50),
            self.buttonBackgroundView.leftAnchor.constraint(equalTo: self.imageMaskView.leftAnchor, constant: 20),
            self.buttonBackgroundView.widthAnchor.constraint(equalToConstant: 25),
            self.buttonBackgroundView.heightAnchor.constraint(equalToConstant: 35)
        ])

        NSLayoutConstraint.activate([
            self.backButtonImageView.centerYAnchor.constraint(equalTo: self.buttonBackgroundView.centerYAnchor),
            self.backButtonImageView.centerXAnchor.constraint(equalTo: self.buttonBackgroundView.centerXAnchor),
            self.backButtonImageView.widthAnchor.constraint(equalTo: self.buttonBackgroundView.widthAnchor),
            self.backButtonImageView.heightAnchor.constraint(equalTo: self.buttonBackgroundView.heightAnchor)
        ])

        NSLayoutConstraint.activate([
            self.cakeImageView.centerXAnchor.constraint(equalTo: self.imageMaskView.centerXAnchor),
            self.cakeImageView.centerYAnchor.constraint(equalTo: self.imageMaskView.centerYAnchor),
            self.cakeImageView.widthAnchor.constraint(equalTo: self.imageMaskView.widthAnchor),
            self.cakeImageView.heightAnchor.constraint(equalTo: self.imageMaskView.heightAnchor)
        ])

        NSLayoutConstraint.activate([
            self.addToBasketButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            self.addToBasketButton.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 25),
            self.addToBasketButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -25)
        ])

        NSLayoutConstraint.activate([
            self.headerTitleLabel.topAnchor.constraint(equalTo: self.imageMaskView.bottomAnchor, constant: 15),
            self.headerTitleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20)
        ])

        NSLayoutConstraint.activate([
            self.subHeaderTitle.topAnchor.constraint(equalTo: self.headerTitleLabel.bottomAnchor, constant: 10),
            self.subHeaderTitle.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20)
        ])
    }

    // MARK: - actions

    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }

}
