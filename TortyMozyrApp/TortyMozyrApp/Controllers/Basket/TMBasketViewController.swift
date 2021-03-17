//
//  TMBasketViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 6.03.21.
//

import UIKit

class TMBasketViewController: UITableViewController {

    struct AKBasketItems {
        let image: UIImage
        let itemNameLabel: UILabel
        let itemPrice: UILabel
    }

    private var items = [
        "Медовик",
        "Шоколадные шары",
        "Наполеон",
        "Грушевый пирог",
        "Подарочный набор"
    ]

    private lazy var rightBarButtonItem: UIBarButtonItem = {
        let deleteImage = UIImage(systemName: "trash.fill")
        let barButton = UIBarButtonItem(image: deleteImage,
                                        landscapeImagePhone: nil,
                                        style: .plain,
                                        target: self,
                                        action: #selector(filterNavBarButtonTapped))
        return barButton
    }()

    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "AKWhite")

        self.title = "Корзина"
        self.navigationItem.setRightBarButton(rightBarButtonItem, animated: true)

        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.register(AKBasketItemCell.self,
                                forCellReuseIdentifier: AKBasketItemCell.reuseIdentifier)
    }

    // MARK: - set up cells

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AKBasketItemCell.reuseIdentifier, for: indexPath)

        (cell as? AKBasketItemCell)?.setCellData(imageName: self.items[indexPath.row],
                                                 imageDescription: "29.99 BYN")
        cell.backgroundColor = #colorLiteral(red: 0.948936522, green: 0.9490728974, blue: 0.9489069581, alpha: 1)
//        cell.imageView?.image = UIImage(named: "fruitCakeImage")
//        cell.textLabel?.text = self.items[indexPath.row]
//        cell.accessoryType = .detailDisclosureButton
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    // MARK: - actions

    @objc func filterNavBarButtonTapped() {

        let alertController = UIAlertController(title: "Очистить корзину?",
                                                message: "Все товары будут удалены",
                                                preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { _ in
        }
        alertController.addAction(cancelAction)

        let deleteAction = UIAlertAction(title: "Очистить", style: .destructive) { _ in
            self.items.removeAll()
            self.tableView.reloadData()
        }
        alertController.addAction(deleteAction)

        self.present(alertController, animated: true, completion: nil)
    }
}
