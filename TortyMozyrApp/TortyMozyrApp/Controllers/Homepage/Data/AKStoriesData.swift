//
//  AKStoriesData.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 4.04.21.
//

import Foundation
import UIKit

class CustomStoriesData {
    var title: String?
    var image: UIImage?
    var url: String?

    init(title: String, image: UIImage, url: String) {
        self.title = title
        self.image = image
        self.url = url
    }
}

let storiesData = [
    CustomStoriesData(title: "Торты в Мозыре", image: #imageLiteral(resourceName: "bigFruitCakeImage"), url: "google.com"),
    CustomStoriesData(title: "На ДР", image: #imageLiteral(resourceName: "medovikCakeImage"), url: "google.com"),
    CustomStoriesData(title: "Торты для детей", image: #imageLiteral(resourceName: "bigFruitCakeImage"), url: "google.com"),
    CustomStoriesData(title: "Учителю", image: #imageLiteral(resourceName: "medovikCakeImage"), url: "google.com"),
    CustomStoriesData(title: "Наборы", image: #imageLiteral(resourceName: "bigFruitCakeImage"), url: "google.com"),
    CustomStoriesData(title: "Пироги", image: #imageLiteral(resourceName: "bigFruitCakeImage"), url: "google.com"),
    CustomStoriesData(title: "Любимым", image: #imageLiteral(resourceName: "medovikCakeImage"), url: "google.com"),
    CustomStoriesData(title: "Торты в Мозыре", image: #imageLiteral(resourceName: "bigFruitCakeImage"), url: "google.com")
]
