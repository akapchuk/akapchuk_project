//
//  TMMainMenuViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 12.04.21.
//

import UIKit
import TTGTagCollectionView

class TMMainMenuViewController: AKViewController {

    // MARK: - properties

    private let cellsPerRow: CGFloat = 2
    private let contentInset = UIEdgeInsets(all: 5)
    private let spaceBetweenCells: CGFloat = 10

    // MARK: - gui variables

    private lazy var tagsCollectionView: TTGTextTagCollectionView = {
        let tags = TTGTextTagCollectionView()
        let textTagConfig = TTGTextTagConfig()
        textTagConfig.backgroundColor = .systemBlue
        textTagConfig.textColor = .white

        tags.addTags(["Cake".localized,
                      "Dessert".localized,
                      "Gift".localized,
                      "Pies".localized,
                      "Sets".localized,
                      "Childhood desserts".localized,
                      "Birthday".localized,
                      "To a loved one".localized], with: textTagConfig)

        tags.scrollDirection = .horizontal
        tags.layer.backgroundColor = UIColor.clear.cgColor
        tags.showsHorizontalScrollIndicator = false
        tags.alignment = .left
        tags.delegate = self
        return tags
    }()

    private var tagSelections = [String]()

    private lazy var collectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = .zero
        return layout
    }()

    private lazy var menuItemsCollectionView: UICollectionView = {
        let menu = UICollectionView(frame: .zero, collectionViewLayout: self.collectionLayout)
        menu.backgroundColor = AKColors.lightPuprple
        menu.showsVerticalScrollIndicator = false
        menu.showsHorizontalScrollIndicator = false
        menu.delegate = self
        menu.dataSource = self
        menu.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        menu.register(TMMenuItemCell.self, forCellWithReuseIdentifier: TMMenuItemCell.reuseIdentifier)
        return menu
    }()

    private lazy var rightBarButtonItem: UIBarButtonItem = {
        let barButton = UIBarButtonItem(barButtonSystemItem: .add,
                                        target: self,
                                        action: #selector(rightBarButtonWasTapped))
        return barButton
    }()

    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Menu".localized
        self.view.backgroundColor = .white

        self.navigationItem.setRightBarButton(rightBarButtonItem, animated: true)

        self.mainView.addSubview(self.menuItemsCollectionView)
        self.menuItemsCollectionView.addSubview(tagsCollectionView)
        self.setContentScrolling(isEnabled: false)
        self.setUpConstraints()
    }

    // MARK: - set up constraints

    private func setUpConstraints() {

        self.tagsCollectionView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(-45)
            make.width.equalToSuperview()
            make.height.equalTo(40)
        }

        self.menuItemsCollectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

    // MARK: - actions

    @objc private func rightBarButtonWasTapped() {
        self.navigationController?.pushViewController(AKCreateCustomOrderViewController(), animated: true)
    }

}

// MARK: - extensions

extension TMMainMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TMMenuItemCell.reuseIdentifier, for: indexPath)

        if let cell = cell as? TMMenuItemCell {
            cell.set(data: menuData[indexPath.row])

            cell.showItem = { [weak self] in
                let imageNameString = menuData[indexPath.row].image
                let titleText = menuData[indexPath.row].title
                let descriptionText = menuData[indexPath.row].description
                let productPrice = menuData[indexPath.row].price

                let controller = AKMenuItemViewController(imageName: imageNameString ?? "launchScreen" ,
                                                          titleTextLabel: titleText,
                                                          descriptionTextLabel: descriptionText,
                                                          productPricePerKg: productPrice ?? 0.0)
                controller.title = "Товар"
                self?.navigationController?.pushViewController(controller, animated: true)
            }

            cell.addItemInBasket = { [weak self] in
                let alertController = UIAlertController(title: "Done".localized,
                                                        message: "Товар добавлен в корзину",
                                                        preferredStyle: .actionSheet)
                let continueAction = UIAlertAction(title: "Продолжить", style: .default) { _ in
                }
                alertController.addAction(continueAction)

                let goToBasketAction = UIAlertAction(title: "Перейти в корзину", style: .default) { _ in
                    self?.navigationController?.pushViewController(TMBasketViewController(), animated: true)
                }
                alertController.addAction(goToBasketAction)

                self?.present(alertController, animated: true, completion: nil)
            }

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

extension TMMainMenuViewController: TTGTextTagCollectionViewDelegate {
    func textTagCollectionView(_ textTagCollectionView: TTGTextTagCollectionView!, didTapTag tagText: String!, at index: UInt, selected: Bool, tagConfig config: TTGTextTagConfig!) {
        tagSelections.append(tagText)
        print(tagSelections)
    }
}
