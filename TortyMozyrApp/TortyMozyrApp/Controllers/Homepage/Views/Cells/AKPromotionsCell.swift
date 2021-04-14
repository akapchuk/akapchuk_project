//
//  AKPromotionsCell.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 6.04.21.
//

import UIKit

class AKPromotionsCell: UICollectionViewCell {

    var promotionsData: CustomPromotionsData? {
        didSet {
            guard let data = promotionsData else { return }
            promotionImageView.image = data.image
            promotionTitle.text = data.title
            promotionPercentTitleLabel.text = data.percent
            gradient.colors = [UIColor.clear.cgColor, data.color.cgColor]

            self.setNeedsUpdateConstraints()
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
    }

    // MARK: - gui variables

    private lazy var promotionImageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        image.isUserInteractionEnabled = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.locations = [0, 1]
        return gradient
    }()

    private lazy var promotionTitle: AKSubheaderTitleLabel = {
        let title = AKSubheaderTitleLabel()
        title.textColor = .white
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    private lazy var promotionPercentColorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [
            .layerMaxXMaxYCorner,
            .layerMinXMaxYCorner
        ]
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var promotionPercentTitleLabel: UILabel = {
        let text = UILabel()
        text.textColor = .white
        text.font = UIFont.systemFont(ofSize: 17, weight: .black)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    // MARK: - cell initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(promotionImageView)
        contentView.addSubview(promotionTitle)
        contentView.addSubview(promotionPercentColorView)
        self.promotionPercentColorView.addSubview(promotionPercentTitleLabel)
        self.promotionImageView.layer.addSublayer(gradient)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        self.gradient.frame = self.promotionImageView.frame
    }

    // MARK: - set up constraints

    override func updateConstraints() {

        self.promotionImageView.snp.updateConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(130)
        }

        self.promotionTitle.snp.updateConstraints { (make) in
            make.width.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
        }

        self.promotionPercentColorView.snp.updateConstraints { (make) in
            make.top.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.2)
            make.height.equalTo(30)
            make.left.equalToSuperview().inset(30)
        }

        self.promotionPercentTitleLabel.snp.updateConstraints { (make) in
            make.center.equalToSuperview()
        }

        super.updateConstraints()
    }

    // Убрать didSet и воспользоваться этой функцией
//    func set(data: CustomPromotionsData) {
//        self.promotionImageView.image = data.image
//        self.promotionTitle.text = data.title
//        self.promotionPercentTitleLabel.text = data.percent
//        self.gradient.frame = self.promotionImageView.frame
//
//        self.setNeedsUpdateConstraints()
//    }
}
