//
//  AKFavouriteViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 2.04.21.
//

import UIKit

class AKFavouriteViewController: UIViewController {

    // MARK: - models

    private var items: [AKBasket] = [
        AKBasket(imageUrl: "https://cdn.bitrix24.by/b8893905/landing/fea/fea7af70800639bcea8436653a403809/tort-mozyr-zakaz_2x.jpg",
                 title: "Медовик",
                 price: "29,99 BYN",
                 isRated: true),
        AKBasket(imageUrl: "https://cdn.bitrix24.by/b8893905/landing/a96/a96912fd72570944dd4d6ff3322f3270/mozyr-tort_2x.jpg",
                 title: "Красный бархат",
                 price: "24,99 BYN",
                 isRated: false),
        AKBasket(imageUrl: "https://cdn-ru.bitrix24.by/b8893905/landing/02c/02c687e00c5832917dd9b10d9e53dfdb/13-tort-8-marta-mozyr_2x.jpg",
                 title: "Торт с фрутками",
                 price: "27,99 BYN",
                 isRated: false)
    ] {
        didSet {
            self.filteredItems = self.items
        }
    }

    private lazy var filteredItems: [AKBasket] = self.items

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
