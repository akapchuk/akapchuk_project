//
//  TMMenuItemCell.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 12.04.21.
//

import UIKit

class TMMenuItemCell: UICollectionViewCell {

    // MARK: - properties

    var showItem: (() -> Void)?
    var addItemInBasket: (() -> Void)?
    
    static let reuseIdentifier = "TMMenuItemCell"

    private let edgeInsets = UIEdgeInsets(top: 6, left: 10, bottom: 0, right: 10)

    private var isLiked = false {
        didSet {
            self.likeIconImage.image = isLiked
                ? UIImage(systemName: "heart.fill")
                : UIImage(systemName: "heart")
            
            self.likeIconImage.tintColor = isLiked
                ? .red : AKColors.darkGray
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
        like.tintColor = AKColors.darkGray
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
        price.textColor = AKColors.darkPurple
        price.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        price.textAlignment = .center
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()

    private lazy var itemImageView: AKImageView = {
        let image = AKImageView()
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 5
        image.layer.cornerRadius = 60
        image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
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
        rating.textColor = AKColors.darkGray
        rating.font = UIFont.systemFont(ofSize: 18, weight: .thin)
        rating.translatesAutoresizingMaskIntoConstraints = false
        return rating
    }()

    private lazy var addToBasketAreaView: UIView = {
        let area = UIView()
        area.backgroundColor = .systemOrange
        area.layer.cornerRadius = 12
        area.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addToBasketButtonTapped)))
        area.translatesAutoresizingMaskIntoConstraints = false
        return area
    }()

    private lazy var addToBasketIconImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "cart.fill.badge.plus")
        image.tintColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
            self.ratingWhiteAreaView,
            self.addToBasketAreaView
        ])

        self.priceBackgroundView.addSubview(priceLabel)
        self.ratingWhiteAreaView.addSubview([self.ratingStarIconImage, self.ratingLabel])
        self.addToBasketAreaView.addSubview(addToBasketIconImage)

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
            make.left.bottom.equalToSuperview().inset(10)
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

        self.addToBasketAreaView.snp.updateConstraints { (make) in
            make.left.equalTo(self.ratingWhiteAreaView.snp.right).offset(20)
            make.right.bottom.equalToSuperview().inset(10)
            make.height.equalTo(30)
        }

        self.addToBasketIconImage.snp.updateConstraints { (make) in
            make.center.equalToSuperview()
        }

        super.updateConstraints()
    }

    func set(data: CustomMenuData) {
        self.titleLabel.text = data.title
        self.priceLabel.text = "\(String(data.price ?? 0)) BYN"
        self.ratingLabel.text = data.rating
        self.itemImageView.image = UIImage(named: data.image ?? "launchScreen")

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

    @objc private func addToBasketButtonTapped() {
        self.addItemInBasket?()
    }

    @objc private func imageTapped() {
        self.showItem?()
    }

}
