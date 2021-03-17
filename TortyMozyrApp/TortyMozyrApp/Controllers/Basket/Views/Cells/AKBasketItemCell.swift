//
//  AKBasketItemCell.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 17.03.21.
//

import UIKit
import SnapKit

class AKBasketItemCell: UITableViewCell {

    static let reuseIdentifier = "AKBasketItemCell"

    // MARK: - gui variables

    private lazy var itemImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "medovikCakeImage")
        image.layer.cornerRadius = 10
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var nameTitleLabel: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        name.textAlignment = .left
        //        name.text = "Торт «Медовик»"
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()

    private lazy var priceTitleLabel: UILabel = {
        let price = UILabel()
        price.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        price.textColor = UIColor(named: "AKLightGray")
        price.textAlignment = .left
        //        price.text = "Торт «Медовик»"
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.initCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initCell() {
        self.contentView.addSubview(itemImage)
        self.contentView.addSubview(nameTitleLabel)
        self.contentView.addSubview(priceTitleLabel)
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: - set up constraints

    override func updateConstraints() {

        self.itemImage.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview().inset(15)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }

        self.nameTitleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(10)
            make.left.equalTo(self.itemImage.snp.right).offset(20)
        }

        self.priceTitleLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().inset(20)
            make.left.equalTo(self.itemImage.snp.right).offset(20)
        }

        super.updateConstraints()
    }

    func setCellData(imageName: String, imageDescription: String) {
        self.nameTitleLabel.text = imageName
        self.priceTitleLabel.text = imageDescription

        self.setNeedsUpdateConstraints()
    }

}
