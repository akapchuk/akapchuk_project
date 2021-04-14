//
//  CustomStoriesData.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 14.04.21.
//

import UIKit

struct CustomStoriesData {
    var title: String
    var image: UIImage
    var url: String
}

let storiesData = [
    CustomStoriesData(title: NSLocalizedString("Pies", comment: ""),
                      image: #imageLiteral(resourceName: "pearPieImage"),
                      url: "google.com"),

    CustomStoriesData(title: "На ДР",
                      image: #imageLiteral(resourceName: "medovikCakeImage"),
                      url: "google.com"),

    CustomStoriesData(title: "Торты для детей",
                      image: #imageLiteral(resourceName: "cupcakeImage"),
                      url: "google.com"),

    CustomStoriesData(title: "Учителю",
                      image: #imageLiteral(resourceName: "trubochkiSecondImage"),
                      url: "google.com"),

    CustomStoriesData(title: "Наборы",
                      image: #imageLiteral(resourceName: "bigFruitCakeImage"),
                      url: "google.com"),

    CustomStoriesData(title: "Торты в Мозыре",
                      image: #imageLiteral(resourceName: "krasniyBarhatImage"),
                      url: "google.com"),

    CustomStoriesData(title: "Любимым",
                      image: #imageLiteral(resourceName: "fruitCakeImage"),
                      url: "google.com"),

    CustomStoriesData(title: "Торты в Мозыре",
                      image: #imageLiteral(resourceName: "blackberryCakeImage"),
                      url: "google.com")
]
