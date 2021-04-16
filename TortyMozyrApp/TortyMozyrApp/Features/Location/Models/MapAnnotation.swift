//
//  MapAnnotation.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 16.04.21.
//

import MapKit

class MapAnnotation: NSObject, MKAnnotation {

    static let identifierPickUp = "identifierPickUp"
    static let identifierMozyr = "identifierMozyr"
    static let identifierKozenki = "identifierKozenki"
    static let identifierDistrict = "identifierDistrict"
    static let identifierKalinkovichi = "identifierKalinkovichi"

    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D

    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
