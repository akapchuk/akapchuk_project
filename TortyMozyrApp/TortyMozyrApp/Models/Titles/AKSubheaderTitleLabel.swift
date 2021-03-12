//
//  AKSubheaderTitleLabel.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 12.03.21.
//

import UIKit


class AKSubheaderTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpLabel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setUpLabel() {
        textColor = UIColor(named: "AKDarkGray")
        font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
    }
}

