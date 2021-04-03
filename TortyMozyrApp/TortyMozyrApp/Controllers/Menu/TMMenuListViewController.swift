//
//  TMMenuListViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 2.04.21.
//

import UIKit

class TMMenuListViewController: UIViewController {

    // MARK: - gui variables

    private lazy var collectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = .zero
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero,
                                    collectionViewLayout: self.collectionLayout)
        view.backgroundColor = .white
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = self
        view.dataSource = self
        view.register(AKProductCell.self, forCellWithReuseIdentifier: AKProductCell.reuseIdentifier)
        return view
    }()

    // MARK: - app life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Меню"

//        self.setContenScrolling(isEnabled: false)

        self.view.addSubview(self.collectionView)

        self.collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

    }

}

// MARK: - extensions

extension TMMenuListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AKProductCell.reuseIdentifier, for: indexPath)

        if let cell = cell as? AKProductCell {
            cell.set(title: "Movie", date: Date())
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Swift.debugPrint(indexPath.row)
    }
}

extension TMMenuListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 115, height: 115)
    }
}
