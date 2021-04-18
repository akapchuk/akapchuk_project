//
//  AKCreateCustomOrderViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 17.04.21.
//

import UIKit

class AKCreateCustomOrderViewController: AKViewController {

    // MARK: - gui variables

    private lazy var backgroundImage: AKCorporateBackgroundImageView = {
        let image = AKCorporateBackgroundImageView()
        image.image = UIImage(named: "bakery-wallpaper")
        return image
    }()

    private lazy var blurView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.effect = UIBlurEffect(style: .regular)
        view.clipsToBounds = true
        return view
    }()

    private lazy var headerTitleLabel: AKSubheaderTitleLabel = {
        let title = AKSubheaderTitleLabel()
        title.text = "Собери свой заказ"
        return title
    }()

    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Сreate an order".localized

        self.mainView.addSubview([
            self.backgroundImage,
            self.blurView
        ])

        self.blurView.contentView.addSubview([
            self.headerTitleLabel
        ])

        self.setUpConstraints()
    }

    // MARK: - methods

    private func setUpConstraints() {

        self.backgroundImage.snp.makeConstraints { (make) in
            make.height.equalTo(800)
            make.edges.equalToSuperview()
        }

        self.blurView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(25)
        }

        self.headerTitleLabel.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().inset(10)
        }

    }

}
