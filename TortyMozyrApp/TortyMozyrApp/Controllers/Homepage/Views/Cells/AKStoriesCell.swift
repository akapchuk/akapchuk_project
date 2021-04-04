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
        view.layer.cornerRadius = 46
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private lazy var whiteCircleStoriesView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 43
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var storiesImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 40
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private lazy var storiesTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(colorCircleStoriesView)
        colorCircleStoriesView.addSubview(whiteCircleStoriesView)
        contentView.addSubview(storiesImageView)
        contentView.addSubview(storiesTitle)

        self.colorCircleStoriesView.snp.makeConstraints { (make) in
            make.size.equalTo(92)
            make.centerX.equalTo(self.storiesImageView.snp.centerX)
            make.centerY.equalTo(self.storiesImageView.snp.centerY)
        }

        self.whiteCircleStoriesView.snp.makeConstraints { (make) in
            make.size.equalTo(86)
            make.centerX.centerY.equalToSuperview()
        }

        self.storiesImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        self.storiesTitle.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.storiesImageView)
            make.top.equalTo(self.storiesImageView.snp.bottom).offset(10)
        }

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
