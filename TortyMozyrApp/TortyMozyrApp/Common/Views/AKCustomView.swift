//
//  AKCustomView.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 15.04.21.
//

import UIKit

class AKCustomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setUpView() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }

}
