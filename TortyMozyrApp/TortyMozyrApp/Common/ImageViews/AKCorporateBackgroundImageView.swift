//
//  AKCorporateBackgroundImageView.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 12.03.21.
//

import UIKit

class AKCorporateBackgroundImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.setUpImageView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setUpImageView() {
        image = UIImage(named: "launchScreen")
        contentMode = .scaleAspectFill
        translatesAutoresizingMaskIntoConstraints = false
    }
}
