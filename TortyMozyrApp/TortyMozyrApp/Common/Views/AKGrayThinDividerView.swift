//
//  AKGrayThinDividerView.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 12.03.21.
//

import UIKit


class AKGrayThinDividerView: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUpView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setUpView() {
        backgroundColor = UIColor(named: "AKLightGray")
        translatesAutoresizingMaskIntoConstraints = false
    }
}
