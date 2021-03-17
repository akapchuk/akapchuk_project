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

    private let items = [
        "medovik",
        "choco balls",
        "napoleon",
        "pear pie",
        "gift box"
    ]

    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "AKWhite")

        self.title = "Корзина"
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

//        cell.imageView?.image = UIImage(named: "fruitCakeImage")
//        cell.textLabel?.text = self.items[indexPath.row]
//        cell.accessoryType = .detailDisclosureButton
        return cell
    }

    // MARK: - actions
}
