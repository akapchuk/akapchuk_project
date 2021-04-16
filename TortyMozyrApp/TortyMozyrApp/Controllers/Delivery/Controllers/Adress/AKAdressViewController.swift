//
//  AKAdressViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 16.04.21.
//

import UIKit
import MapKit

class AKAdressViewController: UIViewController {

    // MARK: - gui variables

    private lazy var mapView: MKMapView = {
        let view = MKMapView()
        view.delegate = self
        return view
    }()

    // MARK: - app life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Пункт самовывоза"

        self.view.addSubview(self.mapView)

        self.mapView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        self.createAnnotation()
    }

    // MARK: - methods

    private func createAnnotation() {
        let pickUpCoordinate = CLLocationCoordinate2D(latitude: 52.048611, longitude: 29.258567)

        let pickUpAnnotation = MapAnnotation(title: "Мы находимся тут!",
                                             subtitle: "ул. Студенческая, 40",
                                             coordinate: pickUpCoordinate)
        self.mapView.addAnnotations([
            pickUpAnnotation
        ])

        self.mapView.setCenter(pickUpCoordinate, animated: true)
    }

}

// MARK: - extensions

extension AKAdressViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? MapAnnotation else  { return nil }

        var annotationView: MKMarkerAnnotationView

        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: MapAnnotation.identifierPickUp) as? MKMarkerAnnotationView {
            annotationView = dequeuedView
        } else {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: MapAnnotation.identifierPickUp)
            annotationView.glyphImage = UIImage(systemName: "heart")
            annotationView.markerTintColor = UIColor(named: "AKBlue")
            annotationView.selectedGlyphImage = UIImage(systemName: "heart.fill")

            annotationView.canShowCallout = true
            annotationView.rightCalloutAccessoryView = UIButton(type: .system)
            annotationView.calloutOffset = CGPoint(x: 5, y: 10)
            annotationView.subtitleVisibility = .visible
        }

        return annotationView
    }

}
