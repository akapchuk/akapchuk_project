//
//  TMMenuItemCell.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 12.04.21.
//

import UIKit

class TMMenuItemCell: UICollectionViewCell {

    static let reuseIdentifier = "TMMenuItemCell"

    private let edgeInsets = UIEdgeInsets(top: 6, left: 10, bottom: 0, right: 10)

    // MARK: - gui variables

    private lazy var tileItemView: UIView = {
        let image = UIView()
        image.backgroundColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.textAlignment = .center
        title.tintColor = .black
        title.font = UIFont.systemFont(ofSize: 17)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    // MARK: - init cell

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.initView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initView() {

        self.translatesAutoresizingMaskIntoConstraints = false

        self.contentView.addSubview([
            self.tileItemView,
            self.titleLabel
        ])
    }

    // MARK: - set up constraints

    override func updateConstraints() {

        self.tileItemView.snp.updateConstraints { (make) in
            make.edges.equalToSuperview()
        }

        self.titleLabel.snp.updateConstraints { (make) in
            /// change after pic add
            make.bottom.left.right.equalToSuperview().inset(5)

        }

        super.updateConstraints()
    }

    func set(title: String) {
        self.titleLabel.text = title

        self.setNeedsUpdateConstraints()
    }

}
