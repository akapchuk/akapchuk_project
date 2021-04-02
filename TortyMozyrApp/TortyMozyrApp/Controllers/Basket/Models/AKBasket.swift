//
//  AKBasket.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 25.03.21.
//

import Foundation

struct AKBasket: Codable {
    let id = UUID()
    var imageUrl: String
    let title: String
    var price: String
    var isRated: Bool
}
