//
//  TMDeliveryVC.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 14.04.21.
//

import UIKit
import Lottie

class TMDeliveryVC: AKViewController {
    
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
        controller.selectedSegmentTintColor = UIColor(named: "AKOrange")
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

    private lazy var deliveryListCollectionView: AKHorizontalCollectionView = {
        let cv = AKHorizontalCollectionView(frame: .zero, collectionViewLayout: AKHorizontalCollectionViewLayout())
        cv.register(TMDeliveryCell.self, forCellWithReuseIdentifier: "deliveryCell")
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()

    private lazy var pageInDevelopingAnimationView: AnimationView = {
        let animation = AnimationView()
        animation.animation = Animation.named("developing")
        animation.contentMode = .scaleAspectFit
        animation.loopMode = .loop
        animation.play()
        return animation
    }()

    private lazy var pageInDevelopingLabel: AKDescriptionTitleLabel = {
        let text = AKDescriptionTitleLabel()
        text.text = NSLocalizedString("Sorry Message", comment: "")
        return text
    }()

    // MARK: - app life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("Delivery", comment: "")
        self.view.backgroundColor = .white

        self.mainView.addSubview(mapOrListSegmentedControl)
        self.mainView.addSubview(deliveryTypeHeaderTitleLabel)
        self.mainView.addSubview(deliveryListCollectionView)
        self.mainView.addSubview(pageInDevelopingAnimationView)
        self.mainView.addSubview(pageInDevelopingLabel)
        
        self.hideMapSectionElements(true)
        self.setUpConstraints()
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
            make.bottom.equalToSuperview() // опасная штука
        }

        self.pageInDevelopingAnimationView.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.7)
            make.top.equalTo(self.deliveryTypeHeaderTitleLabel.snp.bottom).offset(5)
            make.bottom.centerX.equalToSuperview()
        }

        self.pageInDevelopingLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.pageInDevelopingAnimationView.snp.bottom).inset(50)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
        }
    }
    
    // MARK: - actions

    @objc private func handleSegmentValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: // List selected
            self.deliveryTypeHeaderTitleLabel.text = NSLocalizedString("List", comment: "")
            self.deliveryListCollectionView.isHidden = false
            self.hideMapSectionElements(true)
        case 1: // Map selected
            self.deliveryTypeHeaderTitleLabel.text = NSLocalizedString("On Map", comment: "")
            self.deliveryListCollectionView.isHidden = true
            self.hideMapSectionElements(false)
        default:
            print("Default")
        }
    }

    fileprivate func hideMapSectionElements(_ isHide: Bool) {
        self.pageInDevelopingLabel.isHidden = isHide
        self.pageInDevelopingAnimationView.isHidden = isHide
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
        }

        return cell
    }

}
