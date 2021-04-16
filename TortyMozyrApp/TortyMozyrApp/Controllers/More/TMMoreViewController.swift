//
//  TMMoreViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 6.03.21.
//

import UIKit
import SafariServices

class TMMoreViewController: AKViewController {

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
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(instagramTapped)))
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
        image.isUserInteractionEnabled = true
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
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(vkTapped)))
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

    // MARK: - about author banner

    private lazy var aboutAuthorBackgroundView: AKCustomView = {
        let view = AKCustomView()
        view.layer.cornerRadius = 15
        return view
    }()

    private lazy var aboutAuthorImageView: AKImageView = {
        let image = AKImageView()
        image.image = UIImage(named: "about.author")
        image.layer.cornerRadius = 40
        return image
    }()

    private lazy var aboutAuthorTitleLabel: AKSubheaderTitleLabel = {
        let title = AKSubheaderTitleLabel()
        title.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        title.text = NSLocalizedString("About Chef", comment: "")
        return title
    }()

    private lazy var aboutAuthorButton: UIButton = {
        let button = UIButton()
        button.setTitle("Смотреть", for: UIControl.State())
        button.backgroundColor = UIColor(named: "AKOrange")
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(aboutAuthorButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - set up navBar Buttons

    private lazy var leftBarButtonItem: UIBarButtonItem = {
        let favImage = UIImage(systemName: "star.fill")
        let barButton = UIBarButtonItem(image: favImage,
                                        landscapeImagePhone: nil,
                                        style: .plain,
                                        target: self,
                                        action: #selector(favNavBarButtonTapped))
        return barButton
    }()

    // MARK: - app life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = NSLocalizedString("More", comment: "")
        self.navigationItem.setRightBarButton(rightBarButtonItem, animated: false)
        self.navigationItem.setLeftBarButton(leftBarButtonItem, animated: false)
        self.navigationItem.backButtonTitle = " "

        self.view.backgroundColor = UIColor(named: "AKWhite")

        self.mainView.addSubview(socialNetworkBackgroundView)
        self.socialNetworkBackgroundView.addSubview(socailNetworksTitleLabel)
        self.socialNetworkBackgroundView.addSubview(socailNetworksDescriptionLabel)
        self.socialNetworkBackgroundView.addSubview(instagramIconView)
        self.instagramIconView.addSubview(instagramIconImage)
        self.socialNetworkBackgroundView.addSubview(phoneCallIconView)
        self.phoneCallIconView.addSubview(phoneIconImage)
        self.socialNetworkBackgroundView.addSubview(vkIconView)
        self.vkIconView.addSubview(vkIconImage)

        self.mainView.addSubview(aboutAuthorBackgroundView)
        self.aboutAuthorBackgroundView.addSubview(aboutAuthorImageView)
        self.aboutAuthorBackgroundView.addSubview(aboutAuthorTitleLabel)
        self.aboutAuthorBackgroundView.addSubview(aboutAuthorButton)

        self.mainView.addSubview(exitButton)

        self.setUpConstraints()
    }

    // MARK: - set up constraints

    func setUpConstraints() {

        /// set up constraints on social networks view
        self.socialNetworkBackgroundView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(20)
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

        /// About author banner constraints
        self.aboutAuthorBackgroundView.snp.makeConstraints { (make) in
            make.top.equalTo(self.socialNetworkBackgroundView.snp.bottom).offset(270)
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(100)
        }

        self.aboutAuthorImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(10)
            make.size.equalTo(80)
        }

        self.aboutAuthorTitleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(15)
            make.left.equalTo(self.aboutAuthorImageView.snp.right).offset(15)
        }

        self.aboutAuthorButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().inset(15)
            make.left.equalTo(self.aboutAuthorImageView.snp.right).offset(15)
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(30)
        }

        /// Exit button constraints
        self.exitButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.aboutAuthorImageView.snp.bottom).offset(20)
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(25)
        }
    }

    // MARK: - actions

    @objc func infoNavBarButtonTapped() {
        self.navigationController?.pushViewController(AKAboutViewController(), animated: true)
    }
    @objc func favNavBarButtonTapped() {
        self.navigationController?.pushViewController(AKFavouriteViewController(), animated: true)
    }

    @objc func phoneCallTapped() {

    }

    @objc func aboutAuthorButtonTapped() {
        self.navigationController?.pushViewController(AKAboutViewController(), animated: true)
    }

    @objc func instagramTapped() {
        let instargamSafariPage = SFSafariViewController(url: URL(string: "https://www.instagram.com/torty_mozyr/")!)
        present(instargamSafariPage, animated: true)
    }

    @objc func vkTapped() {
        let vkSafariPage = SFSafariViewController(url: URL(string: "https://vk.com/torty_mozyr")!)
        present(vkSafariPage, animated: true)
    }

    @objc func exitButtonTapped() {
        self.navigationController?.pushViewController(AuthorizationViewController(), animated: true)
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }

}
