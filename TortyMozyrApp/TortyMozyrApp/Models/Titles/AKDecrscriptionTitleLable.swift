//
//  AKDecrscriptionTitleLable.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 12.03.21.
//

import UIKit


class AKDescriptionTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLabel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setUpLabel() {
        textColor = UIColor(named: "AKLightGray")
        font = UIFont.systemFont(ofSize: 15, weight: .light)
        textAlignment = .center
        numberOfLines = 0
        translatesAutoresizingMaskIntoConstraints = false
    }
}
