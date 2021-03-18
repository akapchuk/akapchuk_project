//
//  MedovikCakeViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 14.03.21.
//

import UIKit
import SnapKit

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
        image.image = UIImage(named: "medovikCakeImage")
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

    private lazy var subHeaderTitle: UILabel = {
        let subHeader = UILabel()
        subHeader.text = "Вес: \(Int(self.productStepper.value * 1000)) гр."
        subHeader.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        subHeader.translatesAutoresizingMaskIntoConstraints = false
        return subHeader
    }()

    private lazy var descriptionLabel: AKDescriptionTitleLabel = {
        let description = AKDescriptionTitleLabel()
        description.text = "Красивая легенда о многослойном шедевре подарит вам вдохновение и воспоминание, связанные с тортом. А если вы никогда не пробовали «‎Медовик‎»‎, то обязательно захотите это сделать."
        description.textAlignment = .left
        return description
    }()

    private lazy var priceTitle: AKSubheaderTitleLabel = {
        let price = AKSubheaderTitleLabel()
        price.text = "\(self.medovikPrice) BYN"
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()

    private lazy var productStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0.5
        stepper.maximumValue = 3.5
        stepper.stepValue = 0.5
        stepper.value = 1
        stepper.isContinuous = true
        stepper.autorepeat = true
        stepper.addTarget(self, action: #selector(productStepperWasChanged), for: .touchUpInside)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        return stepper
    }()

    private lazy var addToBasketButton: AKSystemButton = {
        let button = AKSystemButton()
        button.setTitle("Добавить в корзину", for: UIControl.State())
        button.backgroundColor = UIColor(named: "AKOrange")
        button.addTarget(self, action: #selector(addToBasketButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        self.view.addSubview(headerTitleLabel)
        self.view.addSubview(subHeaderTitle)
        self.view.addSubview(addToBasketButton)
        self.view.addSubview(productStepper)
        self.view.addSubview(priceTitle)
        self.view.addSubview(descriptionLabel)

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
            self.headerTitleLabel.topAnchor.constraint(equalTo: self.imageMaskView.bottomAnchor, constant: 15),
            self.headerTitleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20)
        ])

        NSLayoutConstraint.activate([
            self.subHeaderTitle.topAnchor.constraint(equalTo: self.headerTitleLabel.bottomAnchor, constant: 10),
            self.subHeaderTitle.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20)
        ])

        self.descriptionLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(25)
            make.top.equalTo(self.subHeaderTitle.snp.bottom).offset(20)
        }

        self.priceTitle.snp.makeConstraints { (make) in
            make.left.equalTo(self.addToBasketButton.snp.left)
//            make.bottom.equalToSuperview().inset(175)
            make.bottom.equalTo(self.addToBasketButton.snp.top).offset(-10)
        }

        self.productStepper.snp.makeConstraints { (make) in
            make.right.equalTo(self.addToBasketButton.snp.right)
            make.bottom.equalTo(self.addToBasketButton.snp.top).offset(-10)
        }

        NSLayoutConstraint.activate([
            self.addToBasketButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            self.addToBasketButton.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 25),
            self.addToBasketButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -25)
        ])
    }

    // MARK: - actions

    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.navigationBar.isHidden = false
    }

    @objc func productStepperWasChanged() {
        print("Stepper value is \(self.productStepper.value)")
        self.priceTitle.text = "\(Double(round((self.medovikPrice * self.productStepper.value) * 100) / 100)) BYN"
        self.subHeaderTitle.text = "Вес \(Int((self.productStepper.value) * 1000)) гр."
    }

    @objc func addToBasketButtonTapped() {
        let alertController = UIAlertController(title: "Готово!",
                                                message: "Товар добавлен в корзину",
                                                preferredStyle: .actionSheet)

        let continueAction = UIAlertAction(title: "Продолжить", style: .default) { _ in
            self.navigationController?.pushViewController(TMMenuViewController(), animated: true)
        }
        alertController.addAction(continueAction)

        let goToBasketAction = UIAlertAction(title: "Перейти в корзину", style: .default) { _ in
            self.navigationController?.pushViewController(TMBasketViewController(), animated: true)
        }
        alertController.addAction(goToBasketAction)

        self.present(alertController, animated: true, completion: nil)
    }

}
