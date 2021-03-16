//
//  AKCorporateBackgroundImageView.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 12.03.21.
//

import UIKit
import SnapKit

class AKCorporateBackgroundImageView: UIView {

    let backgroundImage = UIImage(named: "launchScreen")

    override init(frame: CGRect) {
        super.init(frame: frame)


        contentMode = .scaleAspectFill
        translatesAutoresizingMaskIntoConstraints = false
    }


    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func updateConstraints() {


        self.updateConstraints()
    }
}

// Создать класс наследуемый от UIView . В методе иницаизатора установить настройки.

