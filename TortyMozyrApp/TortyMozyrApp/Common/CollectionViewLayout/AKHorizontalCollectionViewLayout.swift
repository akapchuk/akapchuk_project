//
//  AKHorizontalCollectionViewLayout.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 14.04.21.
//

import UIKit

class AKHorizontalCollectionViewLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        
        scrollDirection = .horizontal
        minimumLineSpacing = 20
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
