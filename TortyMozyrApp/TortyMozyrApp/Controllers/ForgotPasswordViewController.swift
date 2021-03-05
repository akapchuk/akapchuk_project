//
//  ForgotPasswordViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 5.03.21.
//

import UIKit

class ForgotPasswordViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - gui variables
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "launchScreen")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var whiteAreaView: UIView = {
        let whiteView = UIView()
        whiteView.backgroundColor = UIColor(named: "AKWhite")
        whiteView.layer.cornerRadius = 40
        whiteView.layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner
        ]
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        return whiteView
    }()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Сброс пароля"
        title.textColor = UIColor(named: "AKDarkGray")
        title.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        return title
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
    
    private lazy var sendNewPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Выслать новый пароль", for: UIControl.State())
        button.setTitleColor(UIColor(named: "AKWhite"), for: UIControl.State())
        button.backgroundColor = UIColor(named: "AKBlue")
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(sendNewPasswordButtonTapped), for: .touchUpInside)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // text field configuration
        self.emailTextField.keyboardType = .emailAddress
        self.emailTextField.textContentType = .emailAddress
        self.emailTextField.delegate = self
        
        // add gestures
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.viewDidTapped)))
        
        self.view.addSubview(backgroundImageView)
        self.view.addSubview(whiteAreaView)
        self.view.addSubview(titleLabel)
        self.whiteAreaView.addSubview(emailTextField)
        self.emailTextField.addSubview(grayEmailDividerView)
        self.whiteAreaView.addSubview(sendNewPasswordButton)
        self.whiteAreaView.addSubview(backButton)
        
        self.setUpConstraints()
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
            self.whiteAreaView.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -500),
            self.whiteAreaView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
            self.whiteAreaView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0),
            self.whiteAreaView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.whiteAreaView.topAnchor, constant: 25),
            self.titleLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 25),
            self.titleLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -25)
        ])
        
        NSLayoutConstraint.activate([
            self.emailTextField.topAnchor.constraint(equalTo: self.whiteAreaView.topAnchor, constant: 100),
            self.emailTextField.leftAnchor.constraint(equalTo: self.whiteAreaView.leftAnchor, constant: 25),
            self.emailTextField.rightAnchor.constraint(equalTo: self.whiteAreaView.rightAnchor, constant: -25)
        ])
        
        NSLayoutConstraint.activate([
            self.grayEmailDividerView.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 10),
            self.grayEmailDividerView.heightAnchor.constraint(equalToConstant: 1),
            self.grayEmailDividerView.rightAnchor.constraint(equalTo: self.emailTextField.rightAnchor),
            self.grayEmailDividerView.leftAnchor.constraint(equalTo: self.emailTextField.leftAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.sendNewPasswordButton.topAnchor.constraint(equalTo: self.grayEmailDividerView.bottomAnchor,
                                                            constant: 40),
            self.sendNewPasswordButton.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 25),
            self.sendNewPasswordButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -25),
            self.sendNewPasswordButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            self.backButton.topAnchor.constraint(equalTo: self.sendNewPasswordButton.bottomAnchor, constant: 10),
            self.backButton.centerXAnchor.constraint(equalTo: self.whiteAreaView.centerXAnchor)
        ])
    }
    
    // MARK: - actions
    
    @objc private func viewDidTapped() {
        self.view.endEditing(true)
    }
    
    @objc func sendNewPasswordButtonTapped() {
        print("Send password button tapped")
        
        if let emailSymbols = self.emailTextField.text {
            if emailSymbols.isEmpty {
                // UIAlert
                let alertController = UIAlertController(title: "Ошибка",
                                                        message: "Адрес не введен",
                                                        preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "Ввести адрес", style: .default) { _ in
                    print("OK action tapped")
                }
                alertController.addAction(okAction)
                
                let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { _ in
                    print("Отмена")
                }
                alertController.addAction(cancelAction)
    
                self.present(alertController, animated: true, completion: nil)
            } else if !emailSymbols.contains("@") || !emailSymbols.contains(".") {
                // UIAlert
                let alertController = UIAlertController(title: "Ошибка",
                                                        message: "Адрес электронной почты введен некорректно",
                                                        preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "Ввести повторно", style: .default) { _ in
                    print("OK action tapped")
                }
                alertController.addAction(okAction)
                
                let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { _ in
                    print("Отмена")
                }
                alertController.addAction(cancelAction)
    
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
        // UIAlert
        let alertController = UIAlertController(title: "Готово!",
                                                message: "Проверьте вашу почту",
                                                preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            print("OK action tapped")
        }
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func backButtonTapped() {
        print("Back button tapped")
        self.dismiss(animated: true, completion: nil)
    }
    
}
