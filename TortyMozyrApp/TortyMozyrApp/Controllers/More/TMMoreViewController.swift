//
//  TMMoreViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 6.03.21.
//

import UIKit

class TMMoreViewController: UIViewController {

    // MARK: - gui variables

    private lazy var socialNetworkBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var socailNetworksTitleLabel: AKSubheaderTitleLabel = {
        let title = AKSubheaderTitleLabel()
        title.text = "Мы на связи!"
        return title
    }()

    private lazy var socailNetworksDescriptionLabel: AKDescriptionTitleLabel = {
        let title = AKDescriptionTitleLabel()
        title.text = "Позвоните нам или просто напишите в социальныхь сетях."
        return title
    }()

    private lazy var socialNetworksStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    // MARK: - set up icons

    private lazy var instagramIconView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var instagramIconImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "instagram")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var phoneCallIconView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var phoneIconImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "phone")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var vkIconView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var vkIconImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "vk.blue")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var exitButton: AKSystemButton = {
        let button = AKSystemButton()
        button.setTitle("Выйти", for: UIControl.State())
        button.backgroundColor = UIColor(named: "AKDarkGray")
        button.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var rightBarButtonItem: UIBarButtonItem = {
        let infoImage = UIImage(systemName: "info.circle")
        let barButton = UIBarButtonItem(image: infoImage,
                                        landscapeImagePhone: nil,
                                        style: .plain,
                                        target: self,
                                        action: #selector(infoNavBarButtonTapped))
        return barButton
    }()

    // MARK: - app life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Ещё"
        self.navigationItem.setRightBarButton(rightBarButtonItem, animated: false)

        self.view.backgroundColor = UIColor(named: "AKWhite")

        self.view.addSubview(exitButton)
        self.view.addSubview(socialNetworkBackgroundView)
        self.socialNetworkBackgroundView.addSubview(socailNetworksTitleLabel)
        self.socialNetworkBackgroundView.addSubview(socailNetworksDescriptionLabel)
        self.socialNetworkBackgroundView.addSubview(instagramIconView)
        self.instagramIconView.addSubview(instagramIconImage)
        self.socialNetworkBackgroundView.addSubview(phoneCallIconView)
        self.phoneCallIconView.addSubview(phoneIconImage)
        self.socialNetworkBackgroundView.addSubview(vkIconView)
        self.vkIconView.addSubview(vkIconImage)

        self.setUpConstraints()
    }

    // MARK: - set up constraints

    func setUpConstraints() {

        self.socialNetworkBackgroundView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(20)
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(160)
        }

        self.socailNetworksTitleLabel.snp.makeConstraints { (make) in
            make.centerX.width.equalToSuperview()
            make.top.equalToSuperview().inset(10)
        }

        self.socailNetworksDescriptionLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(self.socailNetworksTitleLabel.snp.bottom).offset(5)
        }

        self.instagramIconView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.socailNetworksDescriptionLabel.snp.bottom).offset(15)
            make.width.height.equalTo(50)
        }

        self.instagramIconImage.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }

        self.phoneCallIconView.snp.makeConstraints { (make) in
            make.right.equalTo(self.instagramIconView.snp.right).inset(70)
            make.centerY.equalTo(self.instagramIconView)
            make.width.height.equalTo(50)
        }

        self.phoneIconImage.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }

        self.vkIconView.snp.makeConstraints { (make) in
            make.left.equalTo(self.instagramIconView.snp.left).inset(70)
            make.centerY.equalTo(self.instagramIconView)
            make.width.height.equalTo(50)
        }

        self.vkIconImage.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }

        self.exitButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(20)
            make.left.right.equalToSuperview().inset(25)
        }
    }

    @objc func exitButtonTapped() {
        self.navigationController?.pushViewController(AuthorizationViewController(), animated: true)
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }

    @objc func infoNavBarButtonTapped() {
        self.navigationController?.pushViewController(AKAboutViewController(), animated: true)
    }

}
