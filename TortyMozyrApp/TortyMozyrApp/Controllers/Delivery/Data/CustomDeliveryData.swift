//
//  CustomDeliveryData.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 13.04.21.
//

import UIKit

struct CustomDeliveryListData {
    var title: String
    var price: String
    var url: String
    var image: UIImage
    var color: UIColor
}

let deliveryListItemsData = [
    CustomDeliveryListData(title: "ДОСТАВКА В ПРЕДЕЛАХ ПЕРВОГО РАЙОНА В МОЗЫРЕ",
                           price: "+ 5 BYN",
                           url: "https://yandex.by/maps/-/CCUYe4aoGA",
                           image: #imageLiteral(resourceName: "bigFruitCakeImage"),
                           color: .systemIndigo),

    CustomDeliveryListData(title: "БЫСТРАЯ ДОСТАВКА ПО ГОРОДУ МОЗЫРЮ",
                           price: "+ 10 BYN", url: "https://yandex.by/maps/-/CCUYe4atDA",
                           image: #imageLiteral(resourceName: "blackberryCakeImage"),
                           color: .systemOrange),

    CustomDeliveryListData(title: "ДОСТАВКА В КАЛИНКОВИЧИ / КОЗЕНКИ",
                           price: "+ 20 BYN",
                           url: "https://yandex.by/maps/-/CCUYe4eZ2D",
                           image: #imageLiteral(resourceName: "medovikCakeImage"),
                           color: .systemPurple)
]
