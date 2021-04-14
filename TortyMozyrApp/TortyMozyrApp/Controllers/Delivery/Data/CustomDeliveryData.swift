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
                           image: UIImage(named: "firstDistrictMap") ?? #imageLiteral(resourceName: "firstDistrictMap"),
                           color: .systemIndigo),

    CustomDeliveryListData(title: "БЫСТРАЯ ДОСТАВКА ПО ГОРОДУ МОЗЫРЮ",
                           price: "+ 10 BYN", url: "https://yandex.by/maps/-/CCUYe4atDA",
                           image: UIImage(named: "mozyrMap") ?? #imageLiteral(resourceName: "mozyrMap"),
                           color: .systemOrange),

    CustomDeliveryListData(title: "ДОСТАВКА В КАЛИНКОВИЧИ ИЛИ КОЗЕНКИ",
                           price: "+ 20 BYN",
                           url: "https://yandex.by/maps/-/CCUYe4eZ2D",
                           image: UIImage(named: "kalinkovichiMap") ?? #imageLiteral(resourceName: "kalinkovichiMap"),
                           color: .systemPurple)
]
