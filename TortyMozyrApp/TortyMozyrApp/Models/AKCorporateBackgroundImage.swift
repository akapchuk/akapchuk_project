//
//  AKCorporateBackgroundImage.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 12.03.21.
//

import UIKit

class AKCorporateBackgroundImage: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        setUpImage()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setUpImage() {
        image = UIImage(named: "launchScreen")
        contentMode = .scaleAspectFill
        translatesAutoresizingMaskIntoConstraints = false
    }
}
