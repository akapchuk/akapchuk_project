//
//  AKSmallBlueButton.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 12.03.21.
//

import UIKit

class AKSmallBlueButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)

        setUpButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setUpButton() {
        setTitleColor(AKColors.blue, for: UIControl.State())
        backgroundColor = AKColors.white
        titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
