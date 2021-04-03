//
//  TMBasketViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 6.03.21.
//

import UIKit

class TMBasketViewController: UITableViewController {

    // MARK: - models

    private var items: [AKBasket] = AKDefaults.sh.items {
        didSet {
            AKDefaults.sh.items = self.items
            self.filteredItems = self.items
        }
    }

    private lazy var filteredItems: [AKBasket] = self.items

    // MARK: - gui variables

    private lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.sizeToFit()
        search.barTintColor = UIColor(named: "AKWhite")
        search.placeholder = "Поиск"
        return search
    }()

    private lazy var leftBarButtonItem: UIBarButtonItem = {
        let deleteImage = UIImage(systemName: "trash.fill")
        let barButton = UIBarButtonItem(image: deleteImage,
                                        landscapeImagePhone: nil,
                                        style: .plain,
                                        target: self,
                                        action: #selector(clearNavBarButtonTapped))
        return barButton
    }()

    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "AKWhite")

        self.title = "Корзина"
        self.navigationItem.setLeftBarButton(leftBarButtonItem, animated: true)

        self.tableView.tableHeaderView = self.searchBar
        self.searchBar.delegate = self

        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.register(AKBasketItemCell.self,
                                forCellReuseIdentifier: AKBasketItemCell.reuseIdentifier)
        // table editting settings
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.navigationItem.rightBarButtonItems = [self.editButtonItem]
    }

    // MARK: - fav notification

    private func sendFavActionNotification(id: UUID) {
//        NotificationCenter.default.post(Notification(name: .itemFavAction))
        let notificationInfo: [String: UUID] = ["id": id]
        NotificationCenter.default.post(name: .itemFavAction,
                                        object: nil, userInfo: notificationInfo)
    }

    // MARK: - table view

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AKBasketItemCell.reuseIdentifier, for: indexPath)

        (cell as? AKBasketItemCell)?.setCell(model: self.filteredItems[indexPath.row])
        (cell as? AKBasketItemCell)?.ratingWasTapped = { [weak self] in
            guard let self = self else { return }
            self.items[indexPath.row].isRated.toggle()
            self.sendFavActionNotification(id: self.items[indexPath.row].id)
        }

        cell.backgroundColor = #colorLiteral(red: 0.948936522, green: 0.9490728974, blue: 0.9489069581, alpha: 1)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

    // MARK: - actions

    @objc func clearNavBarButtonTapped() {

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

    // MARK: - editing cells

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

    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        self.items.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        self.tableView.reloadData()
    }

    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)

        self.searchBar.searchTextField.resignFirstResponder()
        self.searchBar.isHidden = editing
    }
}

// MARK: - extensions

extension TMBasketViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.navigationItem.rightBarButtonItems = searchText.isEmpty ? [self.editButtonItem] : nil

        self.filteredItems = searchText.isEmpty
            ? self.items
            : self.items.filter { $0.title.lowercased().contains(searchText.lowercased()) }

        self.tableView.reloadData()
    }
}
