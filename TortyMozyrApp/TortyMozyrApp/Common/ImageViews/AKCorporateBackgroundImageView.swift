//
//  AKCorporateBackgroundImageView.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 12.03.21.
//

import UIKit
import SnapKit

class AKCorporateBackgroundImageView: UIImageView {

    let backgroundImage = UIImage(named: "launchScreen")

    override init(frame: CGRect) {
        super.init(frame: frame)

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    init() {
        super.init(frame: CGRect.zero)

        self.image = backgroundImage
        contentMode = .scaleAspectFill
        translatesAutoresizingMaskIntoConstraints = false
    }

}

// Создать класс наследуемый от UIView . В методе иницаизатора установить настройки.
