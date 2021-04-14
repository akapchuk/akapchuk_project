//
//  TMMainMenuViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 12.04.21.
//

import UIKit
import Foundation

struct CustomMenuData {
    var title: String
    var image: UIImage
    var price: String
    var rating: String
    var isLiked: Bool
    var isFavourite: Bool
}

class TMMainMenuViewController: AKViewController {

    private let cellsPerRow: CGFloat = 2
    private let contentInset = UIEdgeInsets(all: 5)
    private let spaceBetweenCells: CGFloat = 10

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

    // MARK: - gui variables

    private lazy var collectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = .zero
        return layout
    }()

    private lazy var menuItemsCollectionView: UICollectionView = {
        let menu = UICollectionView(frame: .zero, collectionViewLayout: self.collectionLayout)
        menu.backgroundColor = #colorLiteral(red: 0.7804753184, green: 0.8724492192, blue: 1, alpha: 1)
        menu.showsVerticalScrollIndicator = false
        menu.showsHorizontalScrollIndicator = false
        menu.delegate = self
        menu.dataSource = self
        menu.register(TMMenuItemCell.self, forCellWithReuseIdentifier: TMMenuItemCell.reuseIdentifier)
        return menu
    }()

    private lazy var rightBarButtonItem: UIBarButtonItem = {
        let favImage = UIImage(systemName: "heart")
        let barButton = UIBarButtonItem(image: favImage,
                                        landscapeImagePhone: nil,
                                        style: .plain,
                                        target: self,
                                        action: #selector(rightBarButtonWasTapped))
        return barButton
    }()

    // MARK: - initialization

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = NSLocalizedString("Menu", comment: "")
        self.view.backgroundColor = .white

        self.navigationItem.setRightBarButton(rightBarButtonItem, animated: true)

        self.mainView.addSubview(self.menuItemsCollectionView)
        self.setContentScrolling(isEnabled: false)

        self.menuItemsCollectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

    }

    // MARK: - actions

    @objc private func rightBarButtonWasTapped() {

    }

}

// MARK: - extensions

extension TMMainMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.menuData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TMMenuItemCell.reuseIdentifier, for: indexPath)

        if let cell = cell as? TMMenuItemCell {
            cell.set(data: self.menuData[indexPath.row])
        }

        return cell
    }

}

extension TMMainMenuViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = collectionView.bounds.width - self.contentInset.left - self.contentInset.right
        let width = ((availableWidth - self.spaceBetweenCells * (self.cellsPerRow - 1)) / self.cellsPerRow)
        return CGSize(width: width, height: width * 1.5)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.spaceBetweenCells
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(all: 5)
    }

}
