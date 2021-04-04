//
//  AKCustomSearchController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 4.04.21.
//

import UIKit

class AKCustomSearchController: UISearchController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpSearchController()
    }

    private func setUpSearchController() {
        searchBar.placeholder = "Поиск"
        searchBar.tintColor = .white
        searchBar.searchTextField.backgroundColor = .white
        hidesNavigationBarDuringPresentation = false
        obscuresBackgroundDuringPresentation = false
    }

}
