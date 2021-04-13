//
//  TMMainMenuViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 12.04.21.
//

import UIKit
import Foundation

class TMMainMenuViewController: AKViewController {

    private let cellsPerRow: CGFloat = 2
    private let contentInset = UIEdgeInsets(all: 5)
    private let spaceBetweenCells: CGFloat = 10

    private let imageUrls: [String] = [
        "https://cdn.bitrix24.by/b8893905/landing/a96/a96912fd72570944dd4d6ff3322f3270/mozyr-tort_2x.jpg",
        "https://cdn.bitrix24.by/b8893905/landing/fea/fea7af70800639bcea8436653a403809/tort-mozyr-zakaz_2x.jpg",
        "https://cdn.bitrix24.by/b8893905/landing/03e/03efa2ceefd1e74f8cde23ec6c4952f4/tort-na-zakaz-v-mozyre_2x.jpg",
        "https://cdn.bitrix24.by/b8893905/landing/fea/fea7af70800639bcea8436653a403809/tort-mozyr-zakaz_2x.jpg",
        "https://cdn.bitrix24.by/b8893905/landing/fea/fea7af70800639bcea8436653a403809/tort-mozyr-zakaz_2x.jpg",
        "https://cdn.bitrix24.by/b8893905/landing/fea/fea7af70800639bcea8436653a403809/tort-mozyr-zakaz_2x.jpg",
        "https://cdn.bitrix24.by/b8893905/landing/fea/fea7af70800639bcea8436653a403809/tort-mozyr-zakaz_2x.jpg"
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

    // MARK: - initialization

    private lazy var models: [TMMenuItemModel] = self.imageUrls.map { TMMenuItemModel(imageUrl: $0, title: $0, price: $0) }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Меню"
        self.view.backgroundColor = .white

        self.mainView.addSubview(self.menuItemsCollectionView)
        self.setContentScrolling(isEnabled: false)

        self.menuItemsCollectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

    }

}

// MARK: - extensions

extension TMMainMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TMMenuItemCell.reuseIdentifier, for: indexPath)

        if let cell = cell as? TMMenuItemCell {
            cell.set(title: "Item #\(indexPath.row + 1)")
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
