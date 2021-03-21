//
//  AKDarkGraySystemButton.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 9.03.21.
//

import UIKit

class AKSystemButton: UIButton {

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 1, height: 60)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setUpButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setUpButton() {
        setTitleColor(UIColor(named: "AKWhite"), for: UIControl.State())
        backgroundColor = UIColor(named: "AKDarkGray")
        titleLabel?.font = UIFont.systemFont(ofSize: 17)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
    }

}
