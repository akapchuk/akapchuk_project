//
//  AuthorizationViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 2.03.21.
//

import UIKit

class AuthorizationViewController: UIViewController, UITextFieldDelegate {

    // MARK: - gui elements

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

    private lazy var forgotPasswordButton: AKSmallBlueButton = {
        let button = AKSmallBlueButton()
        button.setTitle("Forgot Password".localized, for: UIControl.State())
        button.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var createProfileButton: AKBigBlueButton = {
        let button = AKBigBlueButton()
        button.setTitle("Log In".localized, for: UIControl.State())
        button.addTarget(self, action: #selector(createProfileButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var orLogInWithTextLabel: AKDescriptionTitleLabel = {
        let text = AKDescriptionTitleLabel()
        text.text = "Or Log In With".localized
        text.font = UIFont.systemFont(ofSize: 17, weight: .light)
        return text
    }()

    private lazy var appleIDView: UIView = {
        let orangeView = UIView()
        orangeView.backgroundColor = AKColors.orange
        orangeView.layer.cornerRadius = 8
        orangeView.translatesAutoresizingMaskIntoConstraints = false
        return orangeView
    }()

    private lazy var appleIDImageView: UIImageView = {
        let appleIcon = UIImageView()
        appleIcon.image = UIImage(named: "appleID")
        appleIcon.translatesAutoresizingMaskIntoConstraints = false
        return appleIcon
    }()

    private lazy var facebookView: UIView = {
        let orangeView = UIView()
        orangeView.backgroundColor = AKColors.orange
        orangeView.layer.cornerRadius = 8
        orangeView.translatesAutoresizingMaskIntoConstraints = false
        return orangeView
    }()

    private lazy var facebookImageView: UIImageView = {
        let facebookIcon = UIImageView()
        facebookIcon.image = UIImage(named: "fb")
        facebookIcon.translatesAutoresizingMaskIntoConstraints = false
        return facebookIcon
    }()

    private lazy var googleView: UIView = {
        let orangeView = UIView()
        orangeView.backgroundColor = AKColors.orange
        orangeView.layer.cornerRadius = 8
        orangeView.translatesAutoresizingMaskIntoConstraints = false
        return orangeView
    }()

    private lazy var googleImageView: UIImageView = {
        let googleIcon = UIImageView()
        googleIcon.image = UIImage(named: "google")
        googleIcon.translatesAutoresizingMaskIntoConstraints = false
        return googleIcon
    }()

    private lazy var alreadyHaveAccountStackView: UIStackView = {
        let text = AKDescriptionTitleLabel()
        text.text = "Dont Have".localized
        text.font = UIFont.systemFont(ofSize: 17, weight: .light)

        let button = AKSmallBlueButton()
        button.setTitle("Registration".localized, for: UIControl.State())
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)

        let stack = UIStackView(arrangedSubviews: [text, button])
        stack.axis = .horizontal
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    // MARK: - app life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self

        self.emailTextField.keyboardType = .emailAddress
        self.emailTextField.textContentType = .emailAddress
        self.passwordTextField.textContentType = .password
        self.passwordTextField.isSecureTextEntry = true

        self.view.addSubview(backgroundImageView)
        self.view.addSubview(whiteAreaView)
        self.whiteAreaView.addSubview([
            self.emailTextField,
            self.grayEmailDividerView,
            self.passwordTextField,
            self.grayPasswordDividerView,
            self.forgotPasswordButton,
            self.createProfileButton,
            self.orLogInWithTextLabel,
            self.appleIDView,
            self.facebookView,
            self.googleView,
            self.alreadyHaveAccountStackView
        ])

        self.appleIDView.addSubview(appleIDImageView)
        self.facebookView.addSubview(facebookImageView)
        self.googleView.addSubview(googleImageView)

        self.setUpConstraints()

        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                              action: #selector(self.viewDidTapped)))

        self.appleIDView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                     action: #selector(self.appleIDButtonTapped)))

        self.facebookView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                      action: #selector(self.facebookButtonTapped)))

        self.googleView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                    action: #selector(self.googleButtonTapped)))
    }

    // MARK: - text fields delegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    // MARK: - set constraints

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

        self.forgotPasswordButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(140)
            make.left.equalToSuperview().inset(25)
        }

        self.createProfileButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(210)
            make.left.right.equalToSuperview().inset(25)
        }

        self.orLogInWithTextLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.createProfileButton.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(25)
        }

        NSLayoutConstraint.activate([
            self.appleIDView.rightAnchor.constraint(equalTo: self.facebookView.leftAnchor, constant: -10),
            self.appleIDView.topAnchor.constraint(equalTo: self.orLogInWithTextLabel.bottomAnchor, constant: 15),
            self.appleIDView.widthAnchor.constraint(equalToConstant: 50),
            self.appleIDView.heightAnchor.constraint(equalToConstant: 50),
            self.appleIDImageView.centerXAnchor.constraint(equalTo: self.appleIDView.centerXAnchor),
            self.appleIDImageView.centerYAnchor.constraint(equalTo: self.appleIDView.centerYAnchor),
            self.appleIDImageView.widthAnchor.constraint(equalToConstant: 24),
            self.appleIDImageView.heightAnchor.constraint(equalToConstant: 24)
        ])

        NSLayoutConstraint.activate([
            self.facebookView.topAnchor.constraint(equalTo: self.orLogInWithTextLabel.bottomAnchor, constant: 15),
            self.facebookView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.facebookView.widthAnchor.constraint(equalToConstant: 50),
            self.facebookView.heightAnchor.constraint(equalToConstant: 50),
            self.facebookImageView.centerXAnchor.constraint(equalTo: self.facebookView.centerXAnchor),
            self.facebookImageView.centerYAnchor.constraint(equalTo: self.facebookView.centerYAnchor),
            self.facebookImageView.widthAnchor.constraint(equalToConstant: 24),
            self.facebookImageView.heightAnchor.constraint(equalToConstant: 24)
        ])

        NSLayoutConstraint.activate([
            self.googleView.topAnchor.constraint(equalTo: self.orLogInWithTextLabel.bottomAnchor, constant: 15),
            self.googleView.leftAnchor.constraint(equalTo: self.facebookView.rightAnchor, constant: 10),
            self.googleView.widthAnchor.constraint(equalToConstant: 50),
            self.googleView.heightAnchor.constraint(equalToConstant: 50),
            self.googleImageView.centerXAnchor.constraint(equalTo: self.googleView.centerXAnchor),
            self.googleImageView.centerYAnchor.constraint(equalTo: self.googleView.centerYAnchor),
            self.googleImageView.widthAnchor.constraint(equalToConstant: 20),
            self.googleImageView.heightAnchor.constraint(equalToConstant: 20)
        ])

        self.alreadyHaveAccountStackView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(40) // safe
        }

    }

    // MARK: - actions

    @objc func forgotPasswordButtonTapped() {
        let forgotPasswordVC = ForgotPasswordViewController()
        forgotPasswordVC.modalPresentationStyle = .fullScreen
        self.present(forgotPasswordVC, animated: false)
    }

    @objc func createProfileButtonTapped() {
        UIImpactFeedbackGenerator(style: .soft).impactOccurred()

        (UIApplication.shared.connectedScenes.first?.delegate as?
            SceneDelegate)?.changeRootViewController(TMTabBarViewController(), options: .transitionFlipFromLeft)
    }

    @objc private func registerButtonTapped() {
        let registerVC = RegisterViewController()
        registerVC.modalPresentationStyle = .fullScreen
        self.present(registerVC, animated: false)
    }

    @objc private func viewDidTapped() {
        self.view.endEditing(true)
    }

    @objc private func appleIDButtonTapped() {
        print("Apple ID Button Was Tapped")
    }

    @objc private func facebookButtonTapped() {
        print("Facebooke Button Was Tapped")
    }

    @objc private func googleButtonTapped() {
        print("Google Button Was Tapped")
    }
}
