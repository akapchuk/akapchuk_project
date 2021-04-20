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
    CustomPromotionsData(title: "For all the pies".localized,
                         image: #imageLiteral(resourceName: "strawberryPieImage"),
                         url: "google.com",
                         color: .systemYellow,
                         percent: "-10%"),

    CustomPromotionsData(title: "For every 5th cake".localized,
                         image: #imageLiteral(resourceName: "medovikSecondImage"),
                         url: "google.com",
                         color: .systemTeal,
                         percent: "-25%"),

    CustomPromotionsData(title: "All May".localized,
                         image: #imageLiteral(resourceName: "trubochkiSecondImage"),
                         url: "google.com",
                         color: .systemIndigo, 
                         percent: "-5%")
]
