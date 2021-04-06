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
            promotionColorView.backgroundColor = data.color
        }
    }

    // MARK: - gui variables

    private lazy var promotionImageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var promotionColorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.opacity = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var promotionTitle: AKSubheaderTitleLabel = {
        let title = AKSubheaderTitleLabel()
        title.textColor = .white
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    // MARK: - cell initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(promotionImageView)
        contentView.addSubview(promotionColorView)
        contentView.addSubview(promotionTitle)

        // MARK: - set up constraints

        self.promotionImageView.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(130)
        }

        self.promotionColorView.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(130)
        }

        self.promotionTitle.snp.makeConstraints { (make) in
            make.width.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
