//
//  RegisterViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 10.03.21.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {

    // MARK: - gui variables

    private lazy var backgroundImageView: AKCorporateBackgroundImageView = {
        let imageView = AKCorporateBackgroundImageView()
        return imageView
    }()

    private lazy var whiteAreaView: AKWhiteAreaView = {
        let whiteArea = AKWhiteAreaView()
        return whiteArea
    }()

    private lazy var emailTextField: UITextField = {
        let email = UITextField()
        email.placeholder = "Email".localized
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()

    private lazy var grayEmailDividerView: AKGrayThinDividerView = {
        let divider = AKGrayThinDividerView()
        return divider
    }()

    private lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.placeholder = "Password".localized
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()

    private lazy var grayPasswordDividerView: AKGrayThinDividerView = {
        let divider = AKGrayThinDividerView()
        return divider
    }()

    private lazy var telephoneTextField: UITextField = {
        let telephone = UITextField()
        telephone.placeholder = "Enter your phone number".localized
        telephone.translatesAutoresizingMaskIntoConstraints = false
        return telephone
    }()

    private lazy var grayTelephoneDividerView: AKGrayThinDividerView = {
        let divider = AKGrayThinDividerView()
        return divider
    }()

    private lazy var registerButton: AKBigBlueButton = {
        let button = AKBigBlueButton()
        button.setTitle("Register now".localized, for: UIControl.State())
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var backButton: AKSmallBlueButton = {
        let button = AKSmallBlueButton()
        button.setTitle("Back".localized, for: UIControl.State())
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
        self.view.addSubview(self.whiteAreaView)

        self.whiteAreaView.addSubview([
            self.emailTextField,
            self.grayEmailDividerView,
            self.passwordTextField,
            self.grayPasswordDividerView,
            self.telephoneTextField,
            self.grayTelephoneDividerView,
            self.registerButton,
            self.backButton
        ])

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

        self.backgroundImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        self.whiteAreaView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(450)
            make.left.right.bottom.equalToSuperview()
        }

        self.emailTextField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(50)
            make.left.right.equalToSuperview().inset(25)
        }

        self.grayEmailDividerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(75)
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(1)
        }

        self.passwordTextField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(100)
            make.left.right.equalToSuperview().inset(25)
        }

        self.grayPasswordDividerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(125)
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(1)
        }

        self.telephoneTextField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(150)
            make.left.right.equalToSuperview().inset(25)
        }

        self.grayTelephoneDividerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(175)
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(1)
        }

        self.registerButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(210)
            make.left.right.equalToSuperview().inset(25)
        }

        self.backButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.registerButton.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }

    // MARK: - actions

    @objc private func viewDidTapped() {
        self.view.endEditing(true)
    }

    @objc private func registerButtonTapped() {
        (UIApplication.shared.connectedScenes.first?.delegate as?
            SceneDelegate)?.changeRootViewController(TMTabBarViewController(), options: .transitionFlipFromLeft)
    }

    @objc private func backButtonTapped() {
        self.dismiss(animated: false, completion: nil)
    }

}
