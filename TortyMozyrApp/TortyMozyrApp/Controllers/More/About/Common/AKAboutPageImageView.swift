//
//  AKAboutPageImageView.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 18.03.21.
//

import UIKit

class AKAboutPageImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.setUpImage()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpImage() {
        layer.cornerRadius = 20
        clipsToBounds = true
        contentMode = .scaleAspectFill
        translatesAutoresizingMaskIntoConstraints = false
    }

}
