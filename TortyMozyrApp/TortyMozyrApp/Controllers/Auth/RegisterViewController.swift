//
//  RegisterViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 10.03.21.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {

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

    private lazy var grayEmailDividerView: AKGrayThinDividerView = {
        let divider = AKGrayThinDividerView()
        return divider
    }()

    private lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.placeholder = "Пароль"
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()

    private lazy var grayPasswordDividerView: AKGrayThinDividerView = {
        let divider = AKGrayThinDividerView()
        return divider
    }()

    private lazy var telephoneTextField: UITextField = {
        let telephone = UITextField()
        telephone.placeholder = "Телефон"
        telephone.translatesAutoresizingMaskIntoConstraints = false
        return telephone
    }()

    private lazy var grayTelephoneDividerView: AKGrayThinDividerView = {
        let divider = AKGrayThinDividerView()
        return divider
    }()

    private lazy var registerButton: AKBigBlueButton = {
        let button = AKBigBlueButton()
        button.setTitle("Зарегистрироваться", for: UIControl.State())
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var backButton: AKSmallBlueButton = {
        let button = AKSmallBlueButton()
        button.setTitle("Вернуться", for: UIControl.State())
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.telephoneTextField.delegate = self

        self.emailTextField.keyboardType = .emailAddress
        self.emailTextField.textContentType = .emailAddress
        self.passwordTextField.textContentType = .password
        self.passwordTextField.isSecureTextEntry = true
        self.telephoneTextField.keyboardType = .numberPad
        self.telephoneTextField.textContentType = .telephoneNumber

        self.view.addSubview(backgroundImageView)
        self.view.addSubview(whiteAreaView)
        self.whiteAreaView.addSubview(emailTextField)
        self.whiteAreaView.addSubview(grayEmailDividerView)
        self.whiteAreaView.addSubview(passwordTextField)
        self.whiteAreaView.addSubview(grayPasswordDividerView)
        self.whiteAreaView.addSubview(telephoneTextField)
        self.whiteAreaView.addSubview(grayTelephoneDividerView)
        self.whiteAreaView.addSubview(registerButton)
        self.whiteAreaView.addSubview(backButton)

        // add gestures
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.viewDidTapped)))

        self.setUpConstraints()
    }

    // MARK: - text fields delegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
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

        // -----
        NSLayoutConstraint.activate([
            self.telephoneTextField.topAnchor.constraint(equalTo: self.whiteAreaView.topAnchor, constant: 150),
            self.telephoneTextField.leftAnchor.constraint(equalTo: self.whiteAreaView.leftAnchor, constant: 25),
            self.telephoneTextField.rightAnchor.constraint(equalTo: self.whiteAreaView.rightAnchor, constant: -25)
        ])

        NSLayoutConstraint.activate([
            self.grayTelephoneDividerView.topAnchor.constraint(equalTo: self.whiteAreaView.topAnchor, constant: 175),
            self.grayTelephoneDividerView.leftAnchor.constraint(equalTo: self.whiteAreaView.leftAnchor, constant: 25),
            self.grayTelephoneDividerView.rightAnchor.constraint(equalTo: self.whiteAreaView.rightAnchor, constant: -25),
            self.grayTelephoneDividerView.heightAnchor.constraint(equalToConstant: 1)
        ])

        NSLayoutConstraint.activate([
            self.registerButton.topAnchor.constraint(equalTo: self.whiteAreaView.topAnchor, constant: 210),
            self.registerButton.leftAnchor.constraint(equalTo: self.whiteAreaView.leftAnchor, constant: 25),
            self.registerButton.rightAnchor.constraint(equalTo: self.whiteAreaView.rightAnchor, constant: -25)
        ])

        NSLayoutConstraint.activate([
            self.backButton.topAnchor.constraint(equalTo: self.registerButton.bottomAnchor, constant: 10),
            self.backButton.centerXAnchor.constraint(equalTo: self.whiteAreaView.centerXAnchor)
        ])

    }

    // MARK: - actions

    @objc private func viewDidTapped() {
        self.view.endEditing(true)
    }

    @objc func registerButtonTapped() {
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(TMTabBarViewController(),
                                                                                                           options: .transitionFlipFromLeft)
    }

    @objc func backButtonTapped() {
        self.dismiss(animated: false, completion: nil)
    }

}
