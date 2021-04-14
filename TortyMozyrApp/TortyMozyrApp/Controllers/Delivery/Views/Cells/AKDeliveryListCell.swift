//
//  AKDeliveryListCell.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 13.04.21.
//

import UIKit

class AKDeliveryListCell: UICollectionViewCell {

    var deliveryListData: CustomDeliveryListData? {
        didSet {
            guard let data = deliveryListData else { return }
            colorContainerView.backgroundColor = data.color

            self.setNeedsUpdateConstraints()
        }
    }

    // MARK: - gui variables

    private lazy var colorContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - cell initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(self.colorContainerView)

        self.setNeedsUpdateConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - set up constraints

    override func updateConstraints() {

        self.colorContainerView.snp.updateConstraints { (make) in
            make.edges.equalToSuperview()
        }

        self.updateConstraints()
    }

//    func set(data: CustomDeliveryListData) {
//        self.colorContainerView.backgroundColor = data.color
//
//        self.setNeedsUpdateConstraints()
//    }
}
