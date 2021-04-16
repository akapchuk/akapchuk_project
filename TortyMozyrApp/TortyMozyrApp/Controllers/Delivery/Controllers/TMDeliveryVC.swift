//
//  TMDeliveryVC.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 14.04.21.
//

import UIKit
import Lottie
import MapKit
import WebKit

class TMDeliveryVC: AKViewController {

    // MARK: - variables

    let deliveryListItemsData = [
        CustomDeliveryListData(title: "ДОСТАВКА В ПРЕДЕЛАХ ПЕРВОГО РАЙОНА В МОЗЫРЕ",
                               price: "+ 5 BYN",
                               url: "https://yandex.by/maps/-/CCUYe4aoGA",
                               image: UIImage(named: "firstDistrictMap"),
                               color: .systemIndigo),

        CustomDeliveryListData(title: "БЫСТРАЯ ДОСТАВКА ПО ГОРОДУ МОЗЫРЮ",
                               price: "+ 10 BYN", url: "https://yandex.by/maps/-/CCUYe4atDA",
                               image: UIImage(named: "mozyrMap"),
                               color: .systemOrange),

        CustomDeliveryListData(title: "ДОСТАВКА В КОЗЕНКИ",
                               price: "+ 20 BYN", url: "https://yandex.by/maps/-/CCUYe4atDA",
                               image: UIImage(named: "mozyrMap"),
                               color: .systemPink),

        CustomDeliveryListData(title: "ДОСТАВКА В КАЛИНКОВИЧИ",
                               price: "+ 20 BYN",
                               url: "https://yandex.by/maps/-/CCUYqPt7WB",
                               image: UIImage(named: "kalinkovichiMap") ?? #imageLiteral(resourceName: "kalinkovichiMap"),
                               color: .systemPurple)
    ]

    // MARK: - gui variables

    private lazy var mapOrListSegmentedControl: UISegmentedControl = {
        let items = [NSLocalizedString("List", comment: ""),
                     NSLocalizedString("On Map", comment: "")]
        let itemsPics = [UIImage(systemName: "list.bullet"), UIImage(systemName: "map")]

        let controller = UISegmentedControl(items: itemsPics as [Any])
        controller.selectedSegmentIndex = 0
        controller.layer.cornerRadius = 9
        controller.layer.borderWidth = 1
        controller.layer.masksToBounds = true
        controller.selectedSegmentTintColor = .systemYellow
        controller.layer.borderColor = UIColor(named: "AKDarkGray")?.cgColor
        controller.addTarget(self, action: #selector(handleSegmentValueChanged(_:)), for: .valueChanged)
        controller.translatesAutoresizingMaskIntoConstraints = false
        return controller
    }()

    private lazy var deliveryTypeHeaderTitleLabel: AKHeaderTitleLabel = {
        let header = AKHeaderTitleLabel()
        header.text = NSLocalizedString("List", comment: "")
        return header
    }()

    // MARK: - list vision gui variables

    private lazy var deliveryListCollectionView: AKHorizontalCollectionView = {
        let cv = AKHorizontalCollectionView(frame: .zero, collectionViewLayout: AKHorizontalCollectionViewLayout())
        cv.register(TMDeliveryCell.self, forCellWithReuseIdentifier: "deliveryCell")
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()

    private lazy var pikUpContainerView: AKCustomView = {
        let view = AKCustomView()
        view.backgroundColor = .systemTeal
        view.layer.cornerRadius = 25
        return view
    }()

    private lazy var pickUpImageContainerView: AKCustomView = {
        let view = AKCustomView()
        view.layer.cornerRadius = 20
        view.layer.opacity = 0.7
        return view
    }()

    private lazy var picUpEmojiImage: AKImageView = {
        let image = AKImageView()
        image.image = UIImage(named: "car-emoji")
        return image
    }()

    private lazy var pickUpTitleLabel: AKDescriptionTitleLabel = {
        let title = AKDescriptionTitleLabel()
        title.text = "0 BYN ПРИ ПОЛУЧЕНИИ В ПУНКТЕ САМОВЫВОЗА"
        title.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        title.textColor = .white
        return title
    }()

    private lazy var pickUpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        button.setTitleColor(.black, for: UIControl.State())
        button.setTitle("Посмотреть на карте", for: UIControl.State())
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(pickUpButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - map vision gui variables

    private lazy var mapView: MKMapView = {
        let view = MKMapView()
        view.delegate = self
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [
            .layerMaxXMinYCorner,
            .layerMinXMinYCorner
        ]
        return view
    }()

    // MARK: - app life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = NSLocalizedString("Delivery", comment: "")
        self.view.backgroundColor = .white

        self.navigationItem.backButtonTitle = " "

        self.mainView.addSubview([
            self.mapView,
            self.mapOrListSegmentedControl,
            self.deliveryTypeHeaderTitleLabel,
            self.deliveryListCollectionView,
            self.pikUpContainerView
        ])
        self.pikUpContainerView.addSubview([
            self.pickUpImageContainerView,
            self.picUpEmojiImage,
            self.pickUpTitleLabel,
            self.pickUpButton
        ])

        self.hideMapSectionElements(true)

        self.setUpConstraints()
        self.createAnnotation()
    }

    // MARK: - set up constraints

    private func setUpConstraints() {

        self.mapOrListSegmentedControl.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }

        self.deliveryTypeHeaderTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.mapOrListSegmentedControl.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
        }

        self.deliveryListCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.deliveryTypeHeaderTitleLabel.snp.bottom).offset(20)
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(410)
        }

        self.pikUpContainerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.deliveryListCollectionView.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(150)
            make.bottom.equalToSuperview() // опасная штука
        }

        self.pickUpImageContainerView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.size.equalTo(75)
            make.left.equalToSuperview().inset(25)
        }

        self.picUpEmojiImage.snp.makeConstraints { (make) in
            make.center.equalTo(self.pickUpImageContainerView.snp.center)
            make.size.equalTo(40)
        }

        self.pickUpTitleLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.pickUpButton.snp.top).offset(-10)
            make.width.left.equalTo(self.pickUpButton)
        }

        self.pickUpButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.pickUpImageContainerView.snp.bottom)
            make.left.equalTo(self.pickUpImageContainerView.snp.right).offset(10)
            make.height.equalTo(30)
            make.right.equalToSuperview().inset(10)
        }

        self.mapView.snp.makeConstraints { (make) in
            make.top.equalTo(self.deliveryTypeHeaderTitleLabel.snp.bottom).offset(5)
            make.left.right.bottom.equalToSuperview()
        }

    }

    // MARK: - actions

    @objc private func handleSegmentValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: // List selected
            self.deliveryTypeHeaderTitleLabel.text = NSLocalizedString("List", comment: "")
            self.deliveryListCollectionView.isHidden = false
            self.pikUpContainerView.isHidden = false
            self.hideMapSectionElements(true)
        case 1: // Map selected
            self.deliveryTypeHeaderTitleLabel.text = NSLocalizedString("On Map", comment: "")
            self.deliveryListCollectionView.isHidden = true
            self.pikUpContainerView.isHidden = true
            self.hideMapSectionElements(false)
        default:
            print("Default")
        }
    }

    fileprivate func hideMapSectionElements(_ isHide: Bool) {
        self.mapView.isHidden = isHide
    }

    @objc fileprivate func pickUpButtonTapped() {
        self.navigationController?.pushViewController(AKAdressViewController(), animated: true)
    }

    // MARK: - map locations configure

    private func createAnnotation() {
        let pickUpCoordinate = CLLocationCoordinate2D(latitude: 52.048611,
                                                      longitude: 29.258567)

        let firstDistrictCoordinate = CLLocationCoordinate2D(latitude: 52.048670,
                                                             longitude: 29.266959)

        let mozyrCoordinate = CLLocationCoordinate2D(latitude: 52.037962,
                                                     longitude: 29.221675)

        let kozenkiCoordinate = CLLocationCoordinate2D(latitude: 52.020940,
                                                       longitude: 29.186075)

        let kalinkovichiCoordinate = CLLocationCoordinate2D(latitude: 52.128814,
                                                            longitude: 29.332518)

        let pickUpAnnotation = MapAnnotation(title: "Самовывоз, бесплатно",
                                             subtitle: "ул. Студенческая, 40",
                                             coordinate: pickUpCoordinate)

        let firstDistrictAnnotation = MapAnnotation(title: "Первый район",
                                                    subtitle: "+ 5 BYN",
                                                    coordinate: firstDistrictCoordinate)

        let mozyrAnnotation = MapAnnotation(title: "По Мозырю",
                                                    subtitle: "+ 10 BYN",
                                                    coordinate: mozyrCoordinate)

        let kozenkiAnnotation = MapAnnotation(title: "Доставка в Козенки",
                                                    subtitle: "+ 20 BYN",
                                                    coordinate: kozenkiCoordinate)

        let kalinkovichiAnnotation = MapAnnotation(title: "Доставка в калинковичи",
                                                    subtitle: "+ 20 BYN",
                                                    coordinate: kalinkovichiCoordinate)

        self.mapView.addAnnotations([
            pickUpAnnotation,
            firstDistrictAnnotation,
            mozyrAnnotation,
            kozenkiAnnotation,
            kalinkovichiAnnotation
        ])
        self.mapView.setCenter(mozyrCoordinate, animated: true)
    }
}

// MARK: - extensions

extension TMDeliveryVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 400)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return deliveryListItemsData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "deliveryCell", for: indexPath)

        if let cell = cell as? TMDeliveryCell {
            cell.set(data: deliveryListItemsData[indexPath.row])
            cell.showMap = { [weak self] in
                let url = self?.deliveryListItemsData[indexPath.row].url
                // URL  использовать в webView
                let controller = AKWebViewController(stringUrl: url ?? "https://google.com")
                controller.title = "На карте"
                self?.navigationController?.pushViewController(controller, animated: true)
            }
        }

        return cell
    }

}

extension TMDeliveryVC: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? MapAnnotation else  { return nil }

        var annotationView: MKMarkerAnnotationView

        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: MapAnnotation.identifierPickUp) as? MKMarkerAnnotationView {
            annotationView = dequeuedView
        } else {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: MapAnnotation.identifierPickUp)
            annotationView.glyphImage = UIImage(systemName: "heart")
            annotationView.markerTintColor = UIColor(named: "AKOrange")
            annotationView.selectedGlyphImage = UIImage(systemName: "heart.fill")

            annotationView.canShowCallout = true
            annotationView.rightCalloutAccessoryView = UIButton(type: .system)
            annotationView.calloutOffset = CGPoint(x: 5, y: 10)
            annotationView.subtitleVisibility = .visible
        }

        return annotationView
    }

}
