//
//  AKCustomSearchController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 4.04.21.
//

import UIKit

class AKCustomSearchController: UISearchController {

    init() {
        super.init(searchResultsController: nil)

        self.setUpSearchController()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpSearchController() {
        searchBar.placeholder = "Поиск"
        searchBar.tintColor = .white
        searchBar.searchTextField.backgroundColor = .white
        hidesNavigationBarDuringPresentation = false
        obscuresBackgroundDuringPresentation = false
    }

}
