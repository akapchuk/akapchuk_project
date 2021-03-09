//
//  TMMoreViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 6.03.21.
//

import UIKit

class TMMoreViewController: UIViewController {

    // MARK: - gui variables

    private lazy var exitButton: AKDarkGraySystemButton = {
        let button = AKDarkGraySystemButton()
        button.setTitle("Выйти", for: UIControl.State())
        button.backgroundColor = UIColor(named: "AKDarkGray")
        button.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Ещё"

        self.view.backgroundColor = UIColor(named: "AKWhite")

        self.view.addSubview(exitButton)

        self.setUpConstraints()
    }

    func setUpConstraints() {

        NSLayoutConstraint.activate([
            self.exitButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.exitButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            self.exitButton.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 25),
            self.exitButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -25),
            self.exitButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

    @objc func exitButtonTapped() {
//        self.present(AuthorizationViewController(), animated: true, completion: nil)
        self.navigationController?.pushViewController(AuthorizationViewController(), animated: true)
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }

}
