//
//  AKBigBlueButton.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 5.03.21.
//

import UIKit

class AKBigBlueButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUpButton() {
    setTitleColor(UIColor(named: "AKWhite"), for: UIControl.State())
    backgroundColor = UIColor(named: "AKBlue")
    titleLabel?.font = UIFont.systemFont(ofSize: 17)
    translatesAutoresizingMaskIntoConstraints = false
    layer.cornerRadius = 30
    }
    
}
