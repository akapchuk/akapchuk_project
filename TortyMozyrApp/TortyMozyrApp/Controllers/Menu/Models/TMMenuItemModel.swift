//
//  TMMenuItemModel.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 12.04.21.
//

import UIKit

class TMMenuItemModel {
    let imageUrl: String
    var image: UIImage?
    var title: String
    var isLiked = false
    var isFavorited = false
    var price: String

    init(imageUrl: String, title: String, price: String) {
        self.imageUrl = imageUrl
        self.title = title
        self.price = price
    }
}
