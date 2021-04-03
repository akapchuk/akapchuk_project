//
//  UIView+Ex.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 2.04.21.
//

import UIKit

extension UIView {
    func addSubview(_ views: [UIView]) {
        views.forEach {
            self.addSubview($0)

        }
    }
}
