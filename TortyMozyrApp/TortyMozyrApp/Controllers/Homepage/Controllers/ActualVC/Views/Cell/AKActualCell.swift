//
//  AKActualCell.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 3.04.21.
//

import UIKit

class AKActualCell: UITableViewCell {

    // MARK: - properties

    var showPage: (() -> Void)?

    static let reuseIdentifier = "AKActualCell"

    // MARK: - gui variables

    private lazy var cardContainerView: AKCustomView = {
        let view = AKCustomView()
        view.backgroundColor = AKColors.white
        view.layer.cornerRadius = 15
        return view
    }()

    private lazy var cardImageView: AKImageView = {
        let image = AKImageView()
        image.layer.cornerRadius = 10
        return image
    }()

    private lazy var subheaderTitleLabel: AKSubheaderTitleLabel = {
        let title = AKSubheaderTitleLabel()
        title.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        title.numberOfLines = 0
        title.textAlignment = .left
        return title
    }()

    private lazy var descriptionTitleLabel: AKDescriptionTitleLabel = {
        let title = AKDescriptionTitleLabel()
        title.textAlignment = .left
        title.font = UIFont.systemFont(ofSize: 12)
        return title
    }()

    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = AKColors.blue
        button.layer.cornerRadius = 5
        button.setTitle("More details".localized, for: UIControl.State())
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.initCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.cardContainerView.backgroundColor = selected ? #colorLiteral(red: 0.9680817723, green: 0.9634761214, blue: 0.9716416001, alpha: 1) : AKColors.white

        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
            self.cardContainerView.backgroundColor = AKColors.white
        }
    }

    func initCell() {
        self.contentView.addSubview(cardContainerView)
        self.cardContainerView.addSubview([
            self.cardImageView,
            self.subheaderTitleLabel,
            self.descriptionTitleLabel,
            self.actionButton
        ])

        self.selectionStyle = .none
    }

    // MARK: - set up constraints

    override func updateConstraints() {

        self.cardContainerView.snp.updateConstraints { (make) in
            make.edges.equalToSuperview().inset(10)
            make.height.equalTo(125)
        }

        self.cardImageView.snp.updateConstraints { (make) in
            make.height.equalToSuperview().multipliedBy(0.9)
            make.width.equalTo(110)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(7)
        }

        self.subheaderTitleLabel.snp.updateConstraints { (make) in
            make.top.equalTo(self.cardImageView.snp.top)
            make.left.equalToSuperview().inset(7)
        }

        self.descriptionTitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.subheaderTitleLabel.snp.left)
            make.right.equalTo(self.cardImageView.snp.left)
            make.top.equalTo(self.subheaderTitleLabel.snp.bottom).offset(5)
        }

        self.actionButton.snp.updateConstraints { (make) in
            make.left.bottom.equalToSuperview().inset(7)
            make.width.equalToSuperview().multipliedBy(0.6)
        }

        super.updateConstraints()
    }

    // MARK: - set data

    func setCellData(image: UIImage, imageName: String, imageDescription: String) {
        self.subheaderTitleLabel.text = imageName
        self.descriptionTitleLabel.text = imageDescription
        self.cardImageView.image = image

        self.setNeedsUpdateConstraints()
    }

    // MARK: - actions

    @objc private func actionButtonTapped() {
        self.showPage?()
    }

}
