//
//  GreetingViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 2.03.21.
//

import UIKit
import SnapKit

class GreetingViewController: UIViewController {

    // MARK: - gui variables

    private lazy var backgroundImageView: AKCorporateBackgroundImageView = {
        let imageView = AKCorporateBackgroundImageView()
        return imageView
    }()

    private lazy var whiteAreaView: AKWhiteAreaView = {
        let whiteView = AKWhiteAreaView()
        return whiteView
    }()

    private lazy var welcomeTitleLabel: AKSubheaderTitleLabel = {
        let title = AKSubheaderTitleLabel()
        title.text = "Welcome".localized
        return title
    }()

    private lazy var descriptionLabel: AKDescriptionTitleLabel = {
        let description = AKDescriptionTitleLabel()
        description.text = "Greeting Message".localized
        return description
    }()

    private lazy var startButton: AKBigBlueButton = {
        let button = AKBigBlueButton()
        button.setTitle(NSLocalizedString("Start", comment: ""), for: UIControl.State())
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - app life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.view.addSubview(backgroundImageView)
        self.view.addSubview(whiteAreaView)
        self.whiteAreaView.addSubview(welcomeTitleLabel)
        self.whiteAreaView.addSubview(descriptionLabel)
        self.whiteAreaView.addSubview(startButton)

        self.setUpConstraints()

    }

    // MARK: - constraints

    func setUpConstraints() {

        self.backgroundImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        self.whiteAreaView.snp.makeConstraints { (make) in
            make.height.equalTo(270)
            make.left.right.bottom.equalToSuperview()
        }

        self.welcomeTitleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(15)
            make.left.right.equalToSuperview().inset(25)
        }

        self.descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.welcomeTitleLabel.snp.bottom).offset(15)
            make.left.right.equalToSuperview().inset(25)
        }

        self.startButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().inset(50)
            make.left.right.equalToSuperview().inset(25)
        }
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
