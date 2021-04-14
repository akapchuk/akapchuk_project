//
//  CustomMenuData.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 14.04.21.
//

import UIKit

struct CustomMenuData {
    var title: String
    var image: UIImage
    var price: String
    var rating: String
    var isLiked: Bool
    var isFavourite: Bool
}

let menuData = [
    CustomMenuData(title: "Медовик", image: #imageLiteral(resourceName: "medovikCakeImage"), price: "24.99 BYN", rating: "4.2", isLiked: false, isFavourite: false),
    CustomMenuData(title: "Красный бархат", image: #imageLiteral(resourceName: "krasniyBarhatImage"), price: "29.99 BYN", rating: "4.9", isLiked: false, isFavourite: false),
    CustomMenuData(title: "Пирог с клубникой", image: #imageLiteral(resourceName: "strawberryPieImage"), price: "19.99 BYN", rating: "4.4", isLiked: false, isFavourite: false),
    CustomMenuData(title: "Трубочки со сгущенкой", image: #imageLiteral(resourceName: "trubochkiSecondImage"), price: "39.99 BYN", rating: "4.7", isLiked: false, isFavourite: false),
    CustomMenuData(title: "Грушевый пирог", image: #imageLiteral(resourceName: "pearPieImage"), price: "19.99 BYN", rating: "4.8", isLiked: false, isFavourite: false),
    CustomMenuData(title: "Шоколадные шары с какао", image: #imageLiteral(resourceName: "chocoBallsImage"), price: "29.99 BYN", rating: "5.0", isLiked: false, isFavourite: false),
    CustomMenuData(title: "Капкейки", image: #imageLiteral(resourceName: "cupcakeImage"), price: "20 BYN", rating: "4.1", isLiked: false, isFavourite: false),
    CustomMenuData(title: "Наполеон", image: #imageLiteral(resourceName: "napoleonCakeImage"), price: "29.99 BYN", rating: "4.6", isLiked: false, isFavourite: false)
]


