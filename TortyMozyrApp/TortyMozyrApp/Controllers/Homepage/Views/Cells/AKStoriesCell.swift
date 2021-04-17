//
//  AKStoriesCell.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 4.04.21.
//

import UIKit

class AKStoriesCell: UICollectionViewCell {

    static let reuseIdentifier = "AKStoriesCell"

    var showStories: (() -> Void)?

    private lazy var colorCircleStoriesView: AKCustomView = {
        let view = AKCustomView()
        view.backgroundColor = .systemOrange
        view.layer.cornerRadius = 40
        return view
    }()

    private lazy var whiteCircleStoriesView: AKCustomView = {
        let view = AKCustomView()
        view.layer.cornerRadius = 38
        return view
    }()

    private lazy var storiesImageView: AKImageView = {
        let iv = AKImageView()
        iv.layer.cornerRadius = 35
        return iv
    }()

    private lazy var storiesTitle: AKDescriptionTitleLabel = {
        let title = AKDescriptionTitleLabel()
        title.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return title
    }()

    // MARK: - cell initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(colorCircleStoriesView)
        colorCircleStoriesView.addSubview(whiteCircleStoriesView)
        whiteCircleStoriesView.addSubview(storiesImageView)
        colorCircleStoriesView.addSubview(storiesTitle)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - set up constraints

    override func updateConstraints() {

        self.colorCircleStoriesView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        self.whiteCircleStoriesView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(2)
        }

        self.storiesImageView.snp.makeConstraints { (make) in
            make.size.equalTo(70)
            make.center.equalToSuperview()
        }

        self.storiesTitle.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.storiesImageView)
            make.top.equalTo(self.storiesImageView.snp.bottom).offset(10)
        }

        super.updateConstraints()
    }

    // MARK: - set data

    func set(data: CustomStoriesData) {
        self.storiesImageView.image = data.image
        self.storiesTitle.text = data.title

        self.setNeedsUpdateConstraints()
    }

}
