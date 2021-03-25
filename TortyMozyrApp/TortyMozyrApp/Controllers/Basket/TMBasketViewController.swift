//
//  TMBasketViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 6.03.21.
//

import UIKit

class TMBasketViewController: UITableViewController {

    private var items: [AKBasket] = [
        AKBasket(imageUrl: "https://cdn.bitrix24.by/b8893905/landing/fea/fea7af70800639bcea8436653a403809/tort-mozyr-zakaz_2x.jpg",
                 title: "Медовик",
                 price: "29,99 BYN",
                 isRated: false),
        AKBasket(imageUrl: "https://cdn.bitrix24.by/b8893905/landing/a96/a96912fd72570944dd4d6ff3322f3270/mozyr-tort_2x.jpg",
                 title: "Красный бархат",
                 price: "24,99 BYN",
                 isRated: false),
        AKBasket(imageUrl: "https://cdn-ru.bitrix24.by/b8893905/landing/02c/02c687e00c5832917dd9b10d9e53dfdb/13-tort-8-marta-mozyr_2x.jpg",
                 title: "Торт с фрутками",
                 price: "27,99 BYN",
                 isRated: false)
    ]

    private lazy var leftBarButtonItem: UIBarButtonItem = {
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
        self.navigationItem.setLeftBarButton(leftBarButtonItem, animated: true)

        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.register(AKBasketItemCell.self,
                                forCellReuseIdentifier: AKBasketItemCell.reuseIdentifier)
        // table editting settings
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.navigationItem.rightBarButtonItems = [self.editButtonItem]
    }

    // MARK: - set up cells

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AKBasketItemCell.reuseIdentifier, for: indexPath)

        (cell as? AKBasketItemCell)?.setCell(model: self.items[indexPath.row])
        (cell as? AKBasketItemCell)?.ratingWasTapped = { [weak self] in
            self?.items[indexPath.row].isRated.toggle()
        }

        cell.backgroundColor = #colorLiteral(red: 0.948936522, green: 0.9490728974, blue: 0.9489069581, alpha: 1)
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

//    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .insert
//    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            self.items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath],
                                 with: .middle)
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        case .insert:
            print("insert try")
        default:
            break
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = "Ваш заказ:"
        return title
    }

    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        self.items.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        self.tableView.reloadData()
    }
}
