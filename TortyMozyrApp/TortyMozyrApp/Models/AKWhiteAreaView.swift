//
//  AKWhiteArea.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 5.03.21.
//

import UIKit

class AKWhiteAreaView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setUpView() {
        backgroundColor = UIColor(named: "AKWhite")
        layer.cornerRadius = 40
        layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner
        ]
        translatesAutoresizingMaskIntoConstraints = false
    }
}
