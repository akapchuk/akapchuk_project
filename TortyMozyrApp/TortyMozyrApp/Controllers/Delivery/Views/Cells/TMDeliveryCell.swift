//
//  TMDeliveryCell.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 14.04.21.
//

import UIKit

class TMDeliveryCell: UICollectionViewCell {
    
    // MARK: - gui variables

    private lazy var colorContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var listItemTitle: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        title.textColor = .white
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    private lazy var listPriceTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 35, weight: .semibold)
        title.textColor = .white
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    private lazy var listItemImageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 75
        image.layer.borderWidth = 5
        image.layer.borderColor = UIColor.white.cgColor
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var showInMapButton: UIButton = {
        let button = UIButton()
        button.setTitle("Открыть на картах", for: UIControl.State())
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 10
        button.setTitleColor(.black, for: UIControl.State())
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - cell initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.contentView.addSubview(colorContainerView)
        self.colorContainerView.addSubview(listItemTitle)
        self.colorContainerView.addSubview(listPriceTitle)
        self.colorContainerView.addSubview(listItemImageView)
        self.colorContainerView.addSubview(showInMapButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - set up constraints

    override func updateConstraints() {
        
        self.colorContainerView.snp.updateConstraints { (make) in
            make.edges.equalToSuperview()
        }

        self.listItemTitle.snp.updateConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }

        self.listPriceTitle.snp.updateConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(self.listItemTitle.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }

        self.listItemImageView.snp.updateConstraints { (make) in
            make.size.equalTo(150)
            make.top.equalTo(self.listPriceTitle.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }

        self.showInMapButton.snp.updateConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.bottom.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        
        super.updateConstraints()
    }

    // MARK: - methods
    
    func set(data: CustomDeliveryListData) {
        self.colorContainerView.backgroundColor = data.color
        self.listItemTitle.text = data.title
        self.listPriceTitle.text = data.price
        self.listItemImageView.image = data.image

        self.setNeedsUpdateConstraints()
    }

}
