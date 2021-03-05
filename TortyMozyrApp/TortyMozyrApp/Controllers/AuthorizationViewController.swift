//
//  AuthorizationViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 2.03.21.
//

import UIKit

class AuthorizationViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - gui elements
    
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
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Забыли пароль?", for: UIControl.State())
        button.setTitleColor(UIColor(named: "AKBlue"), for: UIControl.State())
        button.backgroundColor = UIColor(named: "AKWhite")
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        button.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var createProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Создать профиль", for: UIControl.State())
        button.setTitleColor(UIColor(named: "AKWhite"), for: UIControl.State())
        button.backgroundColor = UIColor(named: "AKBlue")
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(createProfileButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var orLogInWithTextLabel: UILabel = {
        let text = UILabel()
        text.text = "или войти с помощью:"
        text.textColor = UIColor(named: "AKLightGray")
        text.font = UIFont.systemFont(ofSize: 17, weight: .light)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .center
        return text
    }()
    
    private lazy var appleIDView: UIView = {
        let orangeView = UIView()
        orangeView.backgroundColor = UIColor(named: "AKOrange")
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
        orangeView.backgroundColor = UIColor(named: "AKOrange")
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
        orangeView.backgroundColor = UIColor(named: "AKOrange")
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
        let text = UILabel()
        text.text = "Уже есть аккаунт?"
        text.textColor = UIColor(named: "AKLightGray")
        text.font = UIFont.systemFont(ofSize: 17, weight: .light)
        
        let button = UIButton()
        button.setTitle("Войти", for: UIControl.State())
        button.setTitleColor(UIColor(named: "AKBlue"), for: UIControl.State())
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        button.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        
        
        let stack = UIStackView(arrangedSubviews: [text, button])
        stack.axis = .horizontal
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - app life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.view.backgroundColor = .white
        
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        self.emailTextField.keyboardType = .emailAddress
        self.emailTextField.textContentType = .emailAddress
        self.passwordTextField.textContentType = .password
        self.passwordTextField.isSecureTextEntry = true
        
        self.view.addSubview(backgroundImageView)
        self.view.addSubview(whiteAreaView)
        self.whiteAreaView.addSubview(emailTextField)
        self.whiteAreaView.addSubview(grayEmailDividerView)
        self.whiteAreaView.addSubview(passwordTextField)
        self.whiteAreaView.addSubview(grayPasswordDividerView)
        self.whiteAreaView.addSubview(forgotPasswordButton)
        self.whiteAreaView.addSubview(createProfileButton)
        self.whiteAreaView.addSubview(orLogInWithTextLabel)
        self.whiteAreaView.addSubview(appleIDView)
        self.appleIDView.addSubview(appleIDImageView)
        self.whiteAreaView.addSubview(facebookView)
        self.facebookView.addSubview(facebookImageView)
        self.whiteAreaView.addSubview(googleView)
        self.googleView.addSubview(googleImageView)
        self.whiteAreaView.addSubview(alreadyHaveAccountStackView)
        
        self.setUpConstraints()
        
        // add gestures
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.viewDidTapped)))
        self.appleIDView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.appleIDButtonTapped)))
        self.facebookView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.facebookButtonTapped)))
        self.googleView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.googleButtonTapped)))
    }
    
    // MARK: - text fields delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    // MARK: - set constraints
    
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
            self.forgotPasswordButton.topAnchor.constraint(equalTo: self.whiteAreaView.topAnchor, constant: 140),
            self.forgotPasswordButton.leftAnchor.constraint(equalTo: self.whiteAreaView.leftAnchor, constant: 25)
        ])
        
        NSLayoutConstraint.activate([
            self.createProfileButton.topAnchor.constraint(equalTo: self.whiteAreaView.topAnchor, constant: 210),
            self.createProfileButton.leftAnchor.constraint(equalTo: self.whiteAreaView.leftAnchor, constant: 25),
            self.createProfileButton.rightAnchor.constraint(equalTo: self.whiteAreaView.rightAnchor, constant: -25),
            self.createProfileButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            self.orLogInWithTextLabel.topAnchor.constraint(equalTo: self.createProfileButton.bottomAnchor, constant: 10),
            self.orLogInWithTextLabel.leftAnchor.constraint(equalTo: self.whiteAreaView.leftAnchor, constant: 25),
            self.orLogInWithTextLabel.rightAnchor.constraint(equalTo: self.whiteAreaView.rightAnchor, constant: -25)
        ])
        
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
            self.googleImageView.widthAnchor.constraint(equalToConstant: 24),
            self.googleImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            self.alreadyHaveAccountStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            self.alreadyHaveAccountStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])

    }
        
    // MARK: - actions
    
    @objc func forgotPasswordButtonTapped() {
        let forgotPasswordVC = ForgotPasswordViewController()
        forgotPasswordVC.modalPresentationStyle = .fullScreen
        self.present(forgotPasswordVC, animated: true)
    }
    
    @objc func createProfileButtonTapped() {
        print("Button 'Создать профиль' was tapped")
    }
    
    @objc func logInButtonTapped() {
        print("Button 'Войти' was tapped")
    }
    
    @objc private func viewDidTapped() {
            self.view.endEditing(true)
        }
    
    @objc func appleIDButtonTapped() {
        print("Apple ID Button Was Tapped")
    }
    
    @objc func facebookButtonTapped() {
        print("Facebooke Button Was Tapped")
    }
    
    @objc func googleButtonTapped() {
        print("Google Button Was Tapped")
    }
}
