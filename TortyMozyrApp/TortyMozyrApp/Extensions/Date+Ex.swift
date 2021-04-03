//
//  Date+Ex.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 2.04.21.
//

import Foundation

extension Date {
    func toString(with dateFormat: String = "HH:mm:ss") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat

        return dateFormatter.string(from: self)
    }
}
