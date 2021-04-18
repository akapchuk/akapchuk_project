//
//  AKAboutPageCell.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 18.03.21.
//

import UIKit

class AKAboutPageCell: UITableViewCell {

    static let reuseIdentifier = "AKAboutPageCell"

    // MARK: - gui variables

    private lazy var cardContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var cardImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 20
        image.image = UIImage(named: "about.author")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var textAreaView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.layer.opacity = 0.95
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var subheaderTitleLabel: AKSubheaderTitleLabel = {
        let title = AKSubheaderTitleLabel()
        title.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        title.textAlignment = .left
        return title
    }()

    private lazy var descriptionTitleLabel: AKDescriptionTitleLabel = {
        let title = AKDescriptionTitleLabel()
        title.textAlignment = .left
        title.font = UIFont.systemFont(ofSize: 12)
        return title
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.initCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.cardContainerView.backgroundColor = selected ? #colorLiteral(red: 0.9680817723, green: 0.9634761214, blue: 0.9716416001, alpha: 1) : .clear

        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
            self.cardContainerView.backgroundColor = .clear
        }
    }

    func initCell() {
        self.contentView.addSubview(cardContainerView)
        self.cardContainerView.addSubview(cardImageView)
        self.contentView.addSubview(textAreaView)
        self.textAreaView.addSubview(subheaderTitleLabel)
        self.textAreaView.addSubview(descriptionTitleLabel)

        self.selectionStyle = .none
    }

    override func updateConstraints() {

        self.cardContainerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        self.cardImageView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview().inset(5)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(200)
        }

        self.textAreaView.snp.makeConstraints { (make) in
            make.top.equalTo(self.cardImageView.snp.bottom).inset(75)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(170)
            make.bottom.equalToSuperview().inset(20)
        }

        self.subheaderTitleLabel.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(15)
            make.width.equalToSuperview().multipliedBy(0.8)
        }

        self.descriptionTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.subheaderTitleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(15)
            make.width.equalToSuperview().multipliedBy(0.9)
        }

        super.updateConstraints()
    }

    func setCellData(image: UIImage, imageName: String, imageDescription: String) {
        self.subheaderTitleLabel.text = imageName
        self.descriptionTitleLabel.text = imageDescription
        self.cardImageView.image = image

        self.setNeedsUpdateConstraints()
    }

}
