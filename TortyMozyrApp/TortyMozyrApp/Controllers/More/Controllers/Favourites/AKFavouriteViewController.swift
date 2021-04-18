//
//  AKFavouriteViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 2.04.21.
//

import UIKit

class AKFavouriteViewController: UIViewController {

    // MARK: - models

    private var items: [AKBasket] = AKDefaults.sh.items.filter { $0.isRated } {
        didSet {
            self.filteredItems = self.items
        }
    }

    private lazy var filteredItems: [AKBasket] = self.items {
        didSet {
            self.tableView.reloadData()
        }
    }

    // MARK: - gui variables

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(AKBasketItemCell.self,
                           forCellReuseIdentifier: AKBasketItemCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Поиск"
        searchController.searchBar.tintColor = .white
        searchController.searchBar.searchTextField.backgroundColor = .white
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        return searchController
    }()

    // MARK: - app life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // до этой строки (01:23:00) все было норм
        self.items = self.items.filter { $0.isRated }

        self.title = "Избранное"

        self.view.addSubview(self.tableView)

        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        self.searchController.searchResultsUpdater = self
        self.navigationItem.searchController = self.searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false

        self.subscribeToNotifications()
    }

    // MARK: - notification center

    private func subscribeToNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(itemFavorAction),
                                               name: .itemFavAction,
                                               object: nil )
    }

    // MARK: - actions

    @objc private func itemFavorAction(_ notification: NSNotification) {
        if let id = notification.userInfo?["id"] as? UUID {
            print("Faved action id is \(id)")

        }

        self.items = AKDefaults.sh.items.filter { $0.isRated }
    }

}

// MARK: - extensions

extension AKFavouriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AKBasketItemCell.reuseIdentifier, for: indexPath)

        if let cell = cell as? AKBasketItemCell {
            cell.setCell(model: self.filteredItems[indexPath.row])
            cell.showFavouriteIcon = false
        }

        return cell
    }

}

extension AKFavouriteViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        self.filteredItems = searchText.isEmpty
            ? self.items
            : self.items.filter { $0.title.lowercased().contains(searchText.lowercased()) }

        self.tableView.reloadData()
    }

}
