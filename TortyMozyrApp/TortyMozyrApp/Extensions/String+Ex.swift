//
//  String+Ex.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 16.04.21.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
