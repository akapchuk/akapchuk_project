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

    var ratingWasTapped: (() -> Void)?

    private var isRated = false {
        didSet {
            self.ratingStarIconImage.image = isRated
                ? UIImage(systemName: "star.fill")
                : UIImage(systemName: "star")

            self.ratingStarIconImage.tintColor = isRated
                ? .systemYellow : .white
        }
    }

    // MARK: - gui variables

    private lazy var cardContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()

    private lazy var itemImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "medovikCakeImage")
        image.layer.cornerRadius = 10
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var nameTitleLabel: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        name.textAlignment = .left
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()

    private lazy var priceTitleLabel: UILabel = {
        let price = UILabel()
        price.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        price.textColor = UIColor(named: "AKLightGray")
        price.textAlignment = .left
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()

    private lazy var ratingStarIconImage: UIImageView = {
        let star = UIImageView()
        star.image = UIImage(systemName: "star")
        star.tintColor = .white
        star.isUserInteractionEnabled = true
        star.translatesAutoresizingMaskIntoConstraints = false
        star.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ratingImageTapped)))
        return star
    }()

    private lazy var itemValueStepper: AKStepper = {
        let stepper = AKStepper()
        stepper.isContinuous = true
        stepper.translatesAutoresizingMaskIntoConstraints = false
        return stepper
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.initCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initCell() {
        self.contentView.addSubview(cardContainerView)
        self.cardContainerView.addSubview(itemImage)
        self.cardContainerView.addSubview(nameTitleLabel)
        self.cardContainerView.addSubview(priceTitleLabel)
        self.itemImage.addSubview(ratingStarIconImage)
        self.cardContainerView.addSubview(itemValueStepper)

        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.cardContainerView.backgroundColor = selected ? #colorLiteral(red: 0.9680817723, green: 0.9634761214, blue: 0.9716416001, alpha: 1) : .white

        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
            self.cardContainerView.backgroundColor = .white
        }
    }

    // MARK: - set up constraints

    override func updateConstraints() {

        self.cardContainerView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview().inset(5)
            make.left.right.equalToSuperview().inset(30)
        }

        self.itemImage.snp.makeConstraints { (make) in
            make.top.left.bottom.equalTo(self.cardContainerView).inset(10)
            make.height.equalTo(75)
            make.width.equalTo(75)
        }

        self.nameTitleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(10)
            make.left.equalTo(self.itemImage.snp.right).offset(20)
        }

        self.priceTitleLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().inset(20)
            make.left.equalTo(self.itemImage.snp.right).offset(20)
        }

        self.ratingStarIconImage.snp.makeConstraints { (make) in
            make.left.bottom.equalToSuperview().inset(5)
            make.size.equalTo(20)
        }

        self.itemValueStepper.snp.makeConstraints { (make) in
            make.right.bottom.equalToSuperview().inset(15)
        }

        super.updateConstraints()
    }

    func setCellData(imageName: String, imageDescription: String) {
        self.nameTitleLabel.text = imageName
        self.priceTitleLabel.text = imageDescription

        self.setNeedsUpdateConstraints()
    }

    func setCell(model: AKBasket) {
        self.nameTitleLabel.text = model.title
        self.priceTitleLabel.text = model.price
        self.isRated = model.isRated
        self.setNeedsUpdateConstraints()
    }

    // MARK: - actions

    @objc private func ratingImageTapped() {
        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
        self.isRated.toggle()
        self.ratingWasTapped?()
    }

}
