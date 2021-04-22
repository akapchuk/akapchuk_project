//
//  AKBigBlueButton.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 5.03.21.
//

import UIKit

class AKBigBlueButton: UIButton {

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 300, height: 60)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setUpButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setUpButton() {
        setTitleColor(AKColors.white, for: UIControl.State())
        backgroundColor = AKColors.blue
        titleLabel?.font = UIFont.systemFont(ofSize: 17)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 30
    }
}
