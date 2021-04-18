//
//  AKAboutPageWhiteAreaView.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 18.03.21.
//

import UIKit

class AKAboutPageWhiteAreaView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.setUpView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setUpView() {
        backgroundColor = .white
        layer.cornerRadius = 15
        layer.opacity = 0.95
        translatesAutoresizingMaskIntoConstraints = false
    }
}
