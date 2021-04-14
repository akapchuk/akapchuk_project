//
//  TMDeliveryVC.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 14.04.21.
//

import UIKit

class TMDeliveryVC: AKViewController {
    
    private lazy var mapOrListSegmentedControl: UISegmentedControl = {
        let items = ["Список", "На карте"]
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
        header.text = "Список"
        return header
    }()
    
    private lazy var deliveryListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(TMDeliveryCell.self, forCellWithReuseIdentifier: "deliveryCell")
        cv.backgroundColor = .clear
        cv.delegate = self
        cv.dataSource = self
        cv.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("Delivery", comment: "")
        
        self.view.backgroundColor = .white
        
        self.mainView.addSubview(mapOrListSegmentedControl)
        self.mainView.addSubview(deliveryTypeHeaderTitleLabel)
        self.mainView.addSubview(self.deliveryListCollectionView)
        
        self.setUpConstraints()
    }
    
    func setUpConstraints() {
        
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
    
    // MARK: - actions
    
    @objc private func handleSegmentValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("Selected the list")
            self.deliveryTypeHeaderTitleLabel.text = "Список"
            self.deliveryListCollectionView.isHidden = false
        case 1:
            print("Selected the map")
            self.deliveryTypeHeaderTitleLabel.text = "На карте"
            self.deliveryListCollectionView.isHidden = true
        default:
            print("Default")
        }
    }
}
