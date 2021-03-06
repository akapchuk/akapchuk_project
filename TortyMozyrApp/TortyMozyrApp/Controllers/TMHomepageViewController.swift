//
//  HomepageViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 5.03.21.
//

import UIKit

class TMHomepageViewController: UIViewController {
    
    private lazy var backButton: AKBigBlueButton = {
        let button = AKBigBlueButton()
        button.setTitle("Назад", for: UIControl.State())
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // NavController customize
        self.title = "Главная"
        let addButton = UIBarButtonItem(systemItem: .add)
        self.navigationItem.setRightBarButton(addButton, animated: false)

        self.view.addSubview(backButton)

        self.view.backgroundColor = UIColor(named: "AKWhite")
        
        self.setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.backButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.backButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.backButton.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 25),
            self.backButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -25),
            self.backButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc func backButtonTapped() {
//        self.present(AuthorizationViewController(), animated: true, completion: nil)
        self.navigationController?.pushViewController(AuthorizationViewController(), animated: true)
    }

}
