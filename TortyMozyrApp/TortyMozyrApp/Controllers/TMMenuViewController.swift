//
//  TMMenuViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 6.03.21.
//

import UIKit

class TMMenuViewController: UIViewController {

    private lazy var leftTileView: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = #colorLiteral(red: 0.9361310005, green: 0.9450566173, blue: 0.9709554315, alpha: 1)

        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.layer.cornerRadius = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var borderForPictureView: UIView = {
        let border = UIView()
        border.backgroundColor = .white
        border.layer.cornerRadius = 52
        border.translatesAutoresizingMaskIntoConstraints = false
        return border
    }()

    private lazy var leftTileImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "medovikCakeImage")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 48
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var itemTitleLabel: UILabel = {
        let title = UILabel()
        title.text = "Торт «Медовик»"
        title.textColor = UIColor(named: "AKDarkGray")
        title.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        return title
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Меню"

        self.view.backgroundColor = #colorLiteral(red: 0.7899044156, green: 0.83537817, blue: 0.9258431196, alpha: 1)

        self.view.addSubview(leftTileView)
        self.leftTileView.addSubview(borderForPictureView)
        self.borderForPictureView.addSubview(leftTileImageView)
        self.leftTileView.addSubview(itemTitleLabel)

        self.setUpConstraints()
    }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.leftTileView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.leftTileView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            self.leftTileView.widthAnchor.constraint(equalToConstant: 150),
            self.leftTileView.heightAnchor.constraint(equalToConstant: 210)
        ])

        NSLayoutConstraint.activate([
            self.borderForPictureView.centerXAnchor.constraint(equalTo: self.leftTileView.centerXAnchor),
            self.borderForPictureView.centerYAnchor.constraint(equalTo: self.leftTileView.centerYAnchor),
            self.borderForPictureView.widthAnchor.constraint(equalToConstant: 104),
            self.borderForPictureView.heightAnchor.constraint(equalToConstant: 104)
        ])

        NSLayoutConstraint.activate([
            self.leftTileImageView.centerXAnchor.constraint(equalTo: self.borderForPictureView.centerXAnchor),
            self.leftTileImageView.centerYAnchor.constraint(equalTo: self.borderForPictureView.centerYAnchor),
            self.leftTileImageView.widthAnchor.constraint(equalToConstant: 96),
            self.leftTileImageView.heightAnchor.constraint(equalToConstant: 96)
        ])

        NSLayoutConstraint.activate([
            self.itemTitleLabel.topAnchor.constraint(equalTo: self.leftTileImageView.bottomAnchor, constant: 7),
            self.itemTitleLabel.centerXAnchor.constraint(equalTo: self.leftTileImageView.centerXAnchor)
        ])
    }

}
