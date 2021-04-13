//
//  AKDefaults.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 2.04.21.
//

import Foundation

class AKDefaults {
    static let sh = AKDefaults()
    
    private struct Keys {
        static let items = "AKItems"
    }
    
    var items: [AKBasket] {
        get {
            self.loadItems()
        }
        
        set {
            self.saveItems(newValue)
        }
    }
    
    private init() {}
    
    func saveItems(_ items: [AKBasket]) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(items) {
            UserDefaults.standard.setValue(data, forKey: Keys.items)
        }
    }
    
    private func loadItems() -> [AKBasket] {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.data(forKey: Keys.items),
           let items = try? decoder.decode([AKBasket].self, from: data) {
            return items
        } else {
            return [
                AKBasket(imageUrl: "https://cdn.bitrix24.by/b8893905/landing/fea/fea7af70800639bcea8436653a403809/tort-mozyr-zakaz_2x.jpg",
                         title: "Медовик",
                         price: "29,99 BYN",
                         isRated: true),
                AKBasket(imageUrl: "https://cdn.bitrix24.by/b8893905/landing/a96/a96912fd72570944dd4d6ff3322f3270/mozyr-tort_2x.jpg",
                         title: "Красный бархат",
                         price: "24,99 BYN",
                         isRated: false),
                AKBasket(imageUrl: "https://cdn-ru.bitrix24.by/b8893905/landing/02c/02c687e00c5832917dd9b10d9e53dfdb/13-tort-8-marta-mozyr_2x.jpg",
                         title: "Торт с фруктами",
                         price: "27,99 BYN",
                         isRated: false)
            ]
        }
    }
}
