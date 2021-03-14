//
//  GreetingViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 2.03.21.
//

import UIKit

class GreetingViewController: UIViewController {

    // MARK: - gui variables

    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "launchScreen")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var whiteAreaView: AKWhiteAreaView = {
        let whiteView = AKWhiteAreaView()
        return whiteView
    }()

    private lazy var welcomeTitleLabel: AKSubheaderTitleLabel = {
        let title = AKSubheaderTitleLabel()
        title.text = "Добро пожаловать"
        return title
    }()

    private lazy var descriptionLabel: AKDescriptionTitleLabel = {
        let description = AKDescriptionTitleLabel()
        description.text = "«Торты в Мозыре» познакомят Вас с миром вкусной, домашней выпечки, которой можно побавловать себя, друзей и родственников. Давайте скорее посмотрим в меню!"
        return description
    }()

    private lazy var startButton: AKBigBlueButton = {
        let button = AKBigBlueButton()
        button.setTitle("Начать", for: UIControl.State())
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - app life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.view.addSubview(backgroundImageView)
        self.view.addSubview(whiteAreaView)
        self.view.addSubview(welcomeTitleLabel)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(startButton)

        self.setUpConstraints()
    }

    // MARK: - constraints

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.backgroundImageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.backgroundImageView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.backgroundImageView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.backgroundImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            self.whiteAreaView.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -270),
            self.whiteAreaView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
            self.whiteAreaView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0),
            self.whiteAreaView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            self.welcomeTitleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,
                                                        constant: -220),
            self.welcomeTitleLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 25),
            self.welcomeTitleLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -25)
        ])

        NSLayoutConstraint.activate([
            self.descriptionLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,
                                                       constant: -170),
            self.descriptionLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 25),
            self.descriptionLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -25)
        ])

        NSLayoutConstraint.activate([
            self.startButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,
                                                  constant: -70),
            self.startButton.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 25),
            self.startButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -25)
        ])
    }

    // MARK: - actions
    @objc func startButtonTapped() {
        let authPage = AuthorizationViewController()
        authPage.modalPresentationStyle = .fullScreen
        self.present(authPage, animated: false)

        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(AuthorizationViewController(),
                                                                                                           options: .transitionCrossDissolve)
    }

}
