//
//  AKHeaderTitleLabel.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 8.03.21.
//

import UIKit


class AKHeaderTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLabel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setUpLabel() {
        textColor = UIColor(named: "AKDarkGray")
        font = UIFont.systemFont(ofSize: 35, weight: .heavy)
        textAlignment = .left
        translatesAutoresizingMaskIntoConstraints = false
    }
}
