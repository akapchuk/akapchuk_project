//
//  AKActualTableViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 3.04.21.
//

import UIKit

class AKActualTableViewController: UITableViewController {

    // MARK: - gui variables

    private var images = [
        UIImage(named: "bigFruitCakeImage"),
        UIImage(named: "cupcakeImage"),
        UIImage(named: "fruitCakeImage"),
        UIImage(named: "krasniyBarhatImage")
    ]

    private var titles = [
        "На большой праздник",
        "Ко дню учителя",
        "Ко дню рождения",
        "Неизменная классика"
    ]

    private var descriptions = [
        "Чтобы удивить всех и немного удивиться самому!",
        "Вкусный подарок для любимого преподавателя.",
        "Раз в году можно побаловать себя чем-то по-настоящему вкусным!",
        "То, что никогда не подводит."
    ]

    // MARK: - app life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false

        self.tableView.register(AKActualCell.self, forCellReuseIdentifier: AKActualCell.reuseIdentifier)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.images.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AKActualCell.reuseIdentifier, for: indexPath)

        if let cell = cell as? AKActualCell {
            cell.setCellData(image: self.images[indexPath.row] ?? #imageLiteral(resourceName: "blackberryCakeImage"),
                             imageName: self.titles[indexPath.row],
                             imageDescription: self.descriptions[indexPath.row],
                             button: UIButton())
        }
        return cell
    }

}
