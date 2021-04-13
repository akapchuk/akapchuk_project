//
//  TMMenuItemCell.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 12.04.21.
//

import UIKit

class TMMenuItemCell: UICollectionViewCell {

    static let reuseIdentifier = "TMMenuItemCell"

    private let edgeInsets = UIEdgeInsets(top: 6, left: 10, bottom: 0, right: 10)

    private var isLiked = false {
        didSet {
            self.likeIconImage.image = isLiked
                ? UIImage(systemName: "heart.fill")
                : UIImage(systemName: "heart")

            self.likeIconImage.tintColor = isLiked
                ? .red : UIColor(named: "AKDarkGray")
        }
    }

    private var isRated = false {
        didSet {
            self.ratingStarIconImage.image = isRated
                ? UIImage(systemName: "star.fill")
                : UIImage(systemName: "star")
        }
    }

    // MARK: - gui variables

    private lazy var tileItemView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var likeIconImage: UIImageView = {
        let like = UIImageView()
        like.image = UIImage(systemName: "heart")
        like.tintColor = UIColor(named: "AKDarkGray")
        like.isUserInteractionEnabled = true
        like.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(likeButtonTapped)))
        like.translatesAutoresizingMaskIntoConstraints = false
        return like
    }()

    private lazy var priceBackgroundView: UIView = {
        let priceView = UIView()
        priceView.backgroundColor = .white
        priceView.layer.cornerRadius = 20
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

    private lazy var itemImageView: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "about.experience")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 5
        image.layer.cornerRadius = 60
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.textAlignment = .center
        title.tintColor = .black
        title.numberOfLines = 0
        title.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    private lazy var ratingWhiteAreaView: UIView = {
        let area = UIView()
        area.backgroundColor = .white
        area.layer.cornerRadius = 12
        area.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ratingButtonTapped)))
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

    // MARK: - init cell

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.initView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initView() {

        self.translatesAutoresizingMaskIntoConstraints = false

        self.contentView.addSubview(tileItemView)
        self.tileItemView.addSubview([
            self.likeIconImage,
            self.priceBackgroundView,
            self.itemImageView,
            self.titleLabel,
            self.ratingWhiteAreaView
        ])
        self.priceBackgroundView.addSubview(priceLabel)
        self.ratingWhiteAreaView.addSubview(ratingStarIconImage)
        self.ratingWhiteAreaView.addSubview(ratingLabel)

    }

    // MARK: - set up constraints

    override func updateConstraints() {

        self.tileItemView.snp.updateConstraints { (make) in
            make.edges.equalToSuperview()
        }

        self.likeIconImage.snp.updateConstraints { (make) in
            make.size.equalTo(28)
            make.left.top.equalToSuperview().inset(5)
        }

        self.priceBackgroundView.snp.updateConstraints { (make) in
            make.top.right.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(30)
        }

        self.priceLabel.snp.updateConstraints { (make) in
            make.center.equalToSuperview()
        }

        self.itemImageView.snp.updateConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.8)
            make.size.equalTo(120)
        }

        self.titleLabel.snp.updateConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(self.itemImageView.snp.bottom).offset(5)

        }

        self.ratingWhiteAreaView.snp.updateConstraints { (make) in
            make.bottom.equalToSuperview().inset(5)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.35)
            make.height.equalTo(30)
        }

        self.ratingStarIconImage.snp.updateConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(5)
        }

        self.ratingLabel.snp.updateConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(5)
        }

        super.updateConstraints()
    }

    func set(data: CustomMenuData) {
        self.titleLabel.text = data.title
        self.priceLabel.text = data.price
        self.ratingLabel.text = data.rating
        self.itemImageView.image = data.image

        self.setNeedsUpdateConstraints()
    }

    // MARK: - actions

    @objc private func likeButtonTapped() {
        self.isLiked.toggle()
        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
    }

    @objc private func ratingButtonTapped() {
        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
        self.isRated.toggle()
    }

}
