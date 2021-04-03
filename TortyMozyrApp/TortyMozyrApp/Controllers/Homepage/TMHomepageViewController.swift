//
//  HomepageViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 5.03.21.
//

import UIKit

class TMHomepageViewController: AKViewController {

    // MARK: - gui variables

    private lazy var storiesHeaderTitleLabel: AKHeaderTitleLabel = {
        let header = AKHeaderTitleLabel()
        header.text = "Истории"
        return header
    }()

    private lazy var actualHeaderTitleLabel: AKHeaderTitleLabel = {
        let header = AKHeaderTitleLabel()
        header.text = "Акутальное"
        return header
    }()

    private lazy var actualImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "medovikSecondImage")
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actualImageWasTapped)))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var rightBarButtonItem: UIBarButtonItem = {
        let barButton = UIBarButtonItem(systemItem: .search)
        return barButton
    }()

    private lazy var leftBarButtonItem: UIBarButtonItem = {
        let barButton = UIBarButtonItem(systemItem: .add)
        return barButton
    }()

    // MARK: - app life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "AKWhite")

        // NavController customize
        self.title = "Главная"
        self.navigationItem.setRightBarButton(rightBarButtonItem, animated: true)
        self.navigationItem.setLeftBarButton(leftBarButtonItem, animated: true)

        self.mainView.addSubview(storiesHeaderTitleLabel)
        self.mainView.addSubview(actualHeaderTitleLabel)
        self.view.addSubview(actualImageView) // ⚠️

        self.setUpConstraints()
    }

    // MARK: - set up constraints

    func setUpConstraints() {

        self.storiesHeaderTitleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.right.equalToSuperview().inset(20)
        }

        self.actualHeaderTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.storiesHeaderTitleLabel).offset(150)
            make.left.right.equalToSuperview().inset(20)
        }

        self.actualImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.actualHeaderTitleLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(150)
        }

    }

    // MARK: - actions

    @objc func actualImageWasTapped() {
        self.navigationController?.pushViewController(AKActualTableViewController(), animated: true)
    }

}
