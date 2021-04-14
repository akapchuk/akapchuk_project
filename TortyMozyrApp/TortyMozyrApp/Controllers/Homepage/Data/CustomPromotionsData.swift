//
//  CustomPromotionsData.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 14.04.21.
//

import UIKit

struct CustomPromotionsData {
    var title: String
    var image: UIImage
    var url: String
    var color: UIColor
    var percent: String
}

let promotionsData = [
    CustomPromotionsData(title: "На все пироги", image: #imageLiteral(resourceName: "strawberryPieImage"), url: "google.com", color: .systemYellow, percent: "-10%"),
    CustomPromotionsData(title: "На каждый 5-й торт", image: #imageLiteral(resourceName: "medovikSecondImage"), url: "google.com", color: .systemTeal, percent: "-25%"),
    CustomPromotionsData(title: "Весь Май", image: #imageLiteral(resourceName: "trubochkiSecondImage"), url: "google.com", color: .systemBlue, percent: "-5%")
]
