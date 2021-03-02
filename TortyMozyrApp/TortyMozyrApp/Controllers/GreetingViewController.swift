//
//  GreetingViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 2.03.21.
//

import UIKit

class GreetingViewController: UIViewController {
    
    // MARK: - add gui elements
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
        title.text = "Добро пожаловать"
        title.textColor = UIColor(named: "AKDarkGray")
        title.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        return title
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let description = UILabel()
        description.text = """
        «Торты в Мозыре» познакомят Вас с миром
        вкусной, домашней выпечки, которой можно
        побавловать себя, друзей и родственников.
        Давайте скорее посмотрим в меню!
        """
        description.textColor = UIColor(named: "AKLightGray")
        description.font = UIFont.systemFont(ofSize: 15, weight: .light)
        description.textAlignment = .center
        description.numberOfLines = 0
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Начать", for: UIControl.State())
        button.setTitleColor(UIColor(named: "AKWhite"), for: UIControl.State())
        button.backgroundColor = UIColor(named: "AKBlue")
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - app life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        // adding views
        self.view.addSubview(backgroundImageView)
        self.view.addSubview(whiteAreaView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(startButton)
        
        // functions calling
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
//            self.whiteAreaView.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 150),
            self.whiteAreaView.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -270),
            self.whiteAreaView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
            self.whiteAreaView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0),
            self.whiteAreaView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,
                                               constant: -220),
            self.titleLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 25),
            self.titleLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -25)
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
            self.startButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -25),
            self.startButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    // MARK: - actions
    @objc func startButtonTapped() {
        self.present(AuthorizationViewController(), animated: true)
    }

}
