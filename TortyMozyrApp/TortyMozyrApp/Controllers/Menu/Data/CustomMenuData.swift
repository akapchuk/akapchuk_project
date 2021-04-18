//
//  CustomMenuData.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 14.04.21.
//

import UIKit

struct CustomMenuData {
    var title: String
    var image: String?
    var price: Double?
    var description: String
    var rating: String
    var isLiked: Bool
    var isFavourite: Bool
}

let menuData = [
    CustomMenuData(title: "Honey Cake".localized,
                   image: "medovikSecondImage",
                   price: 24.99,
                   description: "Honey Cake Description".localized,
                   rating: "4.2",
                   isLiked: false,
                   isFavourite: false),
    CustomMenuData(title: "Red Velvet".localized,
                   image: "krasniyBarhatImage",
                   price: 29.99,
                   description: "Red Velvet Description".localized,
                   rating: "4.9",
                   isLiked: false,
                   isFavourite: false),
    CustomMenuData(title: "Strawberry pie".localized,
                   image: "strawberryPieImage",
                   price: 19.99,
                   description: "Strawberry pie Description".localized,
                   rating: "4.4",
                   isLiked: false,
                   isFavourite: true),
    CustomMenuData(title: "Condensed milk rolls".localized,
                   image: "trubochkiSecondImage",
                   price: 39.99,
                   description: "Condensed rolls Description".localized,
                   rating: "4.7",
                   isLiked: true,
                   isFavourite: false),
    CustomMenuData(title: "Pear pie".localized,
                   image: "pearPieImage",
                   price: 19.99,
                   description: "Pear pie Description".localized,
                   rating: "4.8",
                   isLiked: false,
                   isFavourite: false),
    CustomMenuData(title: "Choco Balls".localized,
                   image: "chocoBallsImage",
                   price: 29.99,
                   description: "Choco Balls Description".localized,
                   rating: "5.0", isLiked: false,
                   isFavourite: false),
    CustomMenuData(title: "Cupcakes".localized,
                   image: "cupcakeImage",
                   price: 19.99,
                   description: "Cupcakes Description".localized,
                   rating: "4.1",
                   isLiked: true,
                   isFavourite: true),
    CustomMenuData(title: "Napoleon".localized,
                   image: "napoleonCakeImage",
                   price: 29.99,
                   description: "Napoleon Description".localized,
                   rating: "4.6",
                   isLiked: false,
                   isFavourite: false)
]
