//
//  AKStoriesCell.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 4.04.21.
//

import UIKit

class AKStoriesCell: UICollectionViewCell {

    var storiesData: CustomStoriesData? {
        didSet {
            guard let data = storiesData else { return }
            storiesImageView.image = data.image
            storiesTitle.text = data.title
        }
    }

    private lazy var colorCircleStoriesView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemOrange
        view.layer.cornerRadius = 40
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private lazy var whiteCircleStoriesView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 38
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var storiesImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 35
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private lazy var storiesTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    // MARK: - cell initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(colorCircleStoriesView)
        colorCircleStoriesView.addSubview(whiteCircleStoriesView)
        whiteCircleStoriesView.addSubview(storiesImageView)
        colorCircleStoriesView.addSubview(storiesTitle)

        self.setNeedsUpdateConstraints()

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

//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        self.colorCircleStoriesView.layer.cornerRadius = self.colorCircleStoriesView.frame.width / 2
//    }
}
