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
    var price: String?
    var description: String
    var rating: String
    var isLiked: Bool
    var isFavourite: Bool
}

let menuData = [
    CustomMenuData(title: "Медовик",
                   image: "medovikSecondImage",
                   price: "24.99 BYN",
                   description: "Another text",
                   rating: "4.2",
                   isLiked: false,
                   isFavourite: false),
    CustomMenuData(title: "Красный бархат",
                   image: "krasniyBarhatImage",
                   price: "29.99 BYN",
                   description: "Another text",
                   rating: "4.9",
                   isLiked: false,
                   isFavourite: false),
    CustomMenuData(title: "Пирог с клубникой",
                   image: "strawberryPieImage",
                   price: "19.99 BYN",
                   description: "Another text",
                   rating: "4.4",
                   isLiked: false,
                   isFavourite: true),
    CustomMenuData(title: "Трубочки со сгущенкой",
                   image: "trubochkiSecondImage",
                   price: "39.99 BYN",
                   description: "Another text",
                   rating: "4.7",
                   isLiked: true,
                   isFavourite: false),
    CustomMenuData(title: "Грушевый пирог",
                   image: "pearPieImage",
                   price: "19.99 BYN",
                   description: "Another text",
                   rating: "4.8",
                   isLiked: false,
                   isFavourite: false),
    CustomMenuData(title: "Шоколадные шары с какао",
                   image: "chocoBallsImage",
                   price: "29.99 BYN",
                   description: "Another text",
                   rating: "5.0", isLiked: false,
                   isFavourite: false),
    CustomMenuData(title: "Капкейки",
                   image: "cupcakeImage",
                   price: "20 BYN",
                   description: "Another text",
                   rating: "4.1",
                   isLiked: true,
                   isFavourite: true),
    CustomMenuData(title: "Наполеон",
                   image: "napoleonCakeImage",
                   price: "29.99 BYN",
                   description: "Another text",
                   rating: "4.6",
                   isLiked: false,
                   isFavourite: false)
]
