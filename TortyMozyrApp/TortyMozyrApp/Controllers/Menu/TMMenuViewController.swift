//
//  TMMenuViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 6.03.21.
//

import UIKit

class TMMenuViewController: UIViewController {

    // MARK: - gui variables

    private lazy var headerTitleLabel: AKHeaderTitleLabel = {
        let header = AKHeaderTitleLabel()
        header.text = "Каталог"
        return header
    }()

    private lazy var leftTileView: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = #colorLiteral(red: 0.9361310005, green: 0.9450566173, blue: 0.9709554315, alpha: 1)
//        stack.distribution = .fillEqually
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

    private lazy var iconBackgroundView: UIView = {
        let circle = UIView()
        circle.backgroundColor = #colorLiteral(red: 0.9751266837, green: 0.9601493478, blue: 0.9733665586, alpha: 1)
        circle.layer.cornerRadius = 18
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
    }()

    private lazy var likeIconImage: UIImageView = {
        let like = UIImageView()
        like.image = UIImage(systemName: "heart")
        like.tintColor = UIColor(named: "AKDarkGray")
        like.translatesAutoresizingMaskIntoConstraints = false
        return like
    }()

    private lazy var priceBackgroundView: UIView = {
        let priceView = UIView()
        priceView.backgroundColor = .white
        priceView.layer.cornerRadius = 10
        priceView.layer.maskedCorners = [
            .layerMinXMaxYCorner,
            .layerMaxXMinYCorner
        ]
        priceView.translatesAutoresizingMaskIntoConstraints = false
        return priceView
    }()

    private lazy var priceLabel: UILabel = {
        let price = UILabel()
        price.text = "29,99 BYN"
        price.textColor = #colorLiteral(red: 0.3361774385, green: 0.3524757922, blue: 0.5931012034, alpha: 1)
        price.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        price.textAlignment = .center
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()

    private lazy var ratingWhiteAreaView: UIView = {
        let area = UIView()
        area.backgroundColor = .white
        area.layer.cornerRadius = 12
        area.translatesAutoresizingMaskIntoConstraints = false
        return area
    }()

    private lazy var ratingStarIconImage: UIImageView = {
        let star = UIImageView()
        star.image = UIImage(systemName: "star")
        star.tintColor = .systemOrange
        star.translatesAutoresizingMaskIntoConstraints = false
        return star
    }()

    private lazy var ratingLabel: UILabel = {
        let rating = UILabel()
        rating.text = "4,9"
        rating.textColor = UIColor(named: "AKDarkGray")
        rating.font = UIFont.systemFont(ofSize: 18, weight: .thin)
        rating.translatesAutoresizingMaskIntoConstraints = false
        return rating
    }()

    private lazy var rightBarButtonItem: UIBarButtonItem = {
        let barButton = UIBarButtonItem(systemItem: .search)
        return barButton
    }()

    private lazy var leftBarButtonItem: UIBarButtonItem = {
        let filterImage = UIImage(systemName: "line.horizontal.3.decrease.circle")
        let barButton = UIBarButtonItem(image: filterImage,
                                        landscapeImagePhone: nil,
                                        style: .plain,
                                        target: self,
                                        action: #selector(filterNavBarButtonTapped))
        return barButton
    }()

    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // navigation controller settings
        self.title = "Меню"
        self.navigationItem.setRightBarButton(rightBarButtonItem, animated: true)
        self.navigationItem.setLeftBarButton(leftBarButtonItem, animated: true)

        self.view.backgroundColor = #colorLiteral(red: 0.7899044156, green: 0.83537817, blue: 0.9258431196, alpha: 1)

        self.view.addSubview(headerTitleLabel)
        self.view.addSubview(leftTileView)
        self.leftTileView.addSubview(borderForPictureView)
        self.borderForPictureView.addSubview(leftTileImageView)
        self.leftTileView.addSubview(itemTitleLabel)
        self.leftTileView.addSubview(iconBackgroundView)
        self.iconBackgroundView.addSubview(likeIconImage)
        self.leftTileView.addSubview(priceBackgroundView)
        self.priceBackgroundView.addSubview(priceLabel)
        self.leftTileView.addSubview(ratingWhiteAreaView)
        self.ratingWhiteAreaView.addSubview(ratingStarIconImage)
        self.ratingWhiteAreaView.addSubview(ratingLabel)


        // MARK: - gestures
        self.iconBackgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(likeButtonTapped)))
        self.ratingWhiteAreaView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ratingButtonTapped)))

        self.setUpConstraints()
    }

    // MARK: - set up constraints

    func setUpConstraints() {

        NSLayoutConstraint.activate([
            self.headerTitleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.headerTitleLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 20)
        ])

        NSLayoutConstraint.activate([
            self.leftTileView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100),
            self.leftTileView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            self.leftTileView.widthAnchor.constraint(equalToConstant: 150),
            self.leftTileView.heightAnchor.constraint(equalToConstant: 220)
        ])

        NSLayoutConstraint.activate([
            self.borderForPictureView.centerXAnchor.constraint(equalTo: self.leftTileView.centerXAnchor),
            self.borderForPictureView.topAnchor.constraint(equalTo: self.leftTileView.topAnchor, constant: 50),
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

        NSLayoutConstraint.activate([
            self.iconBackgroundView.topAnchor.constraint(equalTo: self.leftTileView.topAnchor, constant: 5),
            self.iconBackgroundView.leftAnchor.constraint(equalTo: self.leftTileView.leftAnchor, constant: 5),
            self.iconBackgroundView.heightAnchor.constraint(equalToConstant: 36),
            self.iconBackgroundView.widthAnchor.constraint(equalToConstant: 36)
        ])

        NSLayoutConstraint.activate([
            self.likeIconImage.centerXAnchor.constraint(equalTo: self.iconBackgroundView.centerXAnchor),
            self.likeIconImage.centerYAnchor.constraint(equalTo: self.iconBackgroundView.centerYAnchor),
            self.likeIconImage.heightAnchor.constraint(equalToConstant: 28),
            self.likeIconImage.widthAnchor.constraint(equalToConstant: 30)
        ])

        NSLayoutConstraint.activate([
            self.priceBackgroundView.topAnchor.constraint(equalTo: self.leftTileView.topAnchor),
            self.priceBackgroundView.rightAnchor.constraint(equalTo: self.leftTileView.rightAnchor),
            self.priceBackgroundView.widthAnchor.constraint(equalToConstant: 90),
            self.priceBackgroundView.heightAnchor.constraint(equalToConstant: 30)
        ])

        NSLayoutConstraint.activate([
            self.priceLabel.centerXAnchor.constraint(equalTo: self.priceBackgroundView.centerXAnchor),
            self.priceLabel.centerYAnchor.constraint(equalTo: self.priceBackgroundView.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            self.ratingWhiteAreaView.bottomAnchor.constraint(equalTo: self.leftTileView.bottomAnchor, constant: -10),
            self.ratingWhiteAreaView.centerXAnchor.constraint(equalTo: self.leftTileView.centerXAnchor),
            self.ratingWhiteAreaView.widthAnchor.constraint(equalToConstant: 60),
            self.ratingWhiteAreaView.heightAnchor.constraint(equalToConstant: 25)
        ])

        NSLayoutConstraint.activate([
            self.ratingStarIconImage.centerYAnchor.constraint(equalTo: self.ratingWhiteAreaView.centerYAnchor),
            self.ratingStarIconImage.leftAnchor.constraint(equalTo: self.ratingWhiteAreaView.leftAnchor, constant: 5)
        ])

        NSLayoutConstraint.activate([
            self.ratingLabel.centerYAnchor.constraint(equalTo: self.ratingWhiteAreaView.centerYAnchor),
            self.ratingLabel.rightAnchor.constraint(equalTo: self.ratingWhiteAreaView.rightAnchor, constant: -5)
        ])
    }

    // MARK: - actions

    @objc func filterNavBarButtonTapped() {

    }

    @objc func likeButtonTapped() {
        if self.likeIconImage.tintColor == UIColor(named: "AKDarkGray") {
            self.likeIconImage.tintColor = .systemRed
            self.likeIconImage.image = UIImage(systemName: "heart.fill")
        } else {
            self.likeIconImage.tintColor = UIColor(named: "AKDarkGray")
            self.likeIconImage.image = UIImage(systemName: "heart")
        }
    }

    @objc func ratingButtonTapped() {
        if self.ratingStarIconImage.tintColor == UIColor.systemOrange {
            self.ratingStarIconImage.tintColor = UIColor(named: "AKOrange")
            self.ratingStarIconImage.image = UIImage(systemName: "star.fill")
        } else {
            self.ratingStarIconImage.tintColor = UIColor.systemOrange
            self.ratingStarIconImage.image = UIImage(systemName: "star")
        }
    }

}
