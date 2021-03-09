//
//  LogInViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 9.03.21.
//

import UIKit

class LogInViewController: UIViewController {

    // MARK: - gui variables

    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "launchScreen")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var whiteAreaView: AKWhiteAreaView = {
        let whiteArea = AKWhiteAreaView()
        return whiteArea
    }()

    private lazy var emailTextField: UITextField = {
        let email = UITextField()
        email.placeholder = "Электронная почта"
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()

    private lazy var grayEmailDividerView: UIView = {
        let divider = UIView()
        divider.backgroundColor = UIColor(named: "AKLightGray")
        divider.translatesAutoresizingMaskIntoConstraints = false
        return divider
    }()

    private lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.placeholder = "Пароль"
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()

    private lazy var grayPasswordDividerView: UIView = {
        let divider = UIView()
        divider.backgroundColor = UIColor(named: "AKLightGray")
        divider.translatesAutoresizingMaskIntoConstraints = false
        return divider
    }()

    private lazy var logInButton: AKBigBlueButton = {
        let button = AKBigBlueButton()
        button.setTitle("Войти", for: UIControl.State())
        button.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Вернуться", for: UIControl.State())
        button.setTitleColor(UIColor(named: "AKBlue"), for: UIControl.State())
        button.backgroundColor = UIColor(named: "AKWhite")
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(backgroundImageView)
        self.view.addSubview(whiteAreaView)
        self.whiteAreaView.addSubview(emailTextField)
        self.whiteAreaView.addSubview(grayEmailDividerView)
        self.whiteAreaView.addSubview(passwordTextField)
        self.whiteAreaView.addSubview(grayPasswordDividerView)
        self.whiteAreaView.addSubview(logInButton)
        self.whiteAreaView.addSubview(backButton)

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
            self.whiteAreaView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -450),
            self.whiteAreaView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
            self.whiteAreaView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0),
            self.whiteAreaView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            self.emailTextField.topAnchor.constraint(equalTo: self.whiteAreaView.topAnchor, constant: 50),
            self.emailTextField.leftAnchor.constraint(equalTo: self.whiteAreaView.leftAnchor, constant: 25),
            self.emailTextField.rightAnchor.constraint(equalTo: self.whiteAreaView.rightAnchor, constant: -25)
        ])

        NSLayoutConstraint.activate([
            self.grayEmailDividerView.topAnchor.constraint(equalTo: self.whiteAreaView.topAnchor, constant: 75),
            self.grayEmailDividerView.leftAnchor.constraint(equalTo: self.whiteAreaView.leftAnchor, constant: 25),
            self.grayEmailDividerView.rightAnchor.constraint(equalTo: self.whiteAreaView.rightAnchor, constant: -25),
            self.grayEmailDividerView.heightAnchor.constraint(equalToConstant: 1)
        ])

        NSLayoutConstraint.activate([
            self.passwordTextField.topAnchor.constraint(equalTo: self.whiteAreaView.topAnchor, constant: 100),
            self.passwordTextField.leftAnchor.constraint(equalTo: self.whiteAreaView.leftAnchor, constant: 25),
            self.passwordTextField.rightAnchor.constraint(equalTo: self.whiteAreaView.rightAnchor, constant: -25)
        ])

        NSLayoutConstraint.activate([
            self.grayPasswordDividerView.topAnchor.constraint(equalTo: self.whiteAreaView.topAnchor, constant: 125),
            self.grayPasswordDividerView.leftAnchor.constraint(equalTo: self.whiteAreaView.leftAnchor, constant: 25),
            self.grayPasswordDividerView.rightAnchor.constraint(equalTo: self.whiteAreaView.rightAnchor, constant: -25),
            self.grayPasswordDividerView.heightAnchor.constraint(equalToConstant: 1)
        ])

        NSLayoutConstraint.activate([
            self.logInButton.topAnchor.constraint(equalTo: self.whiteAreaView.topAnchor, constant: 210),
            self.logInButton.leftAnchor.constraint(equalTo: self.whiteAreaView.leftAnchor, constant: 25),
            self.logInButton.rightAnchor.constraint(equalTo: self.whiteAreaView.rightAnchor, constant: -25),
            self.logInButton.heightAnchor.constraint(equalToConstant: 60)
        ])

        NSLayoutConstraint.activate([
            self.backButton.topAnchor.constraint(equalTo: self.logInButton.bottomAnchor, constant: 10),
            self.backButton.centerXAnchor.constraint(equalTo: self.whiteAreaView.centerXAnchor)
        ])

    }

    // MARK: - actions

    @objc func logInButtonTapped() {
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(TMTabBarViewController(),
                                                                                                           options: .transitionFlipFromLeft)
    }

    @objc func backButtonTapped() {
        self.dismiss(animated: false, completion: nil)
    }
}
