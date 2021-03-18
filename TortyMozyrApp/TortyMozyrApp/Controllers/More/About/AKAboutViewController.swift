//
//  AKAboutViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 18.03.21.
//

import UIKit

class AKAboutViewController: UITableViewController {

    var images = [
        UIImage(named: "about.mozyr"),
        UIImage(named: "about.experience"),
        UIImage(named: "about.author"),
        UIImage(named: "about.commerce")
    ]

    var titles = [
        "Мы из Мозыря",
        "Наша философия",
        "Кто готовит?",
        "Мы и корпоративные клиенты"
    ]

    var descriptions = [
        "Мы изготовим торт на заказ в Мозыре для вашего торжества: торт на юбилей, торт на день рождения, детский торт под заказ для девочек и мальчиков, торт на крестины и др. Вы можете ежедневно заказать торты в Мозыре по телефону +375 (29) 230-91-33",
        "Требовательно относимся ко всему, что делаем. На кухне тщательно отбираем продукты, следим за отточенностью работы и аккуратностью подачи блюд, стремимся к идеальному сервису.",
        "Валентина – это мастер кулинарного искусства в Мозыре, создающая шедевры и являющаяся вашими проводником в мир новых вкусовых ощущений, которые познакомят вас с необычной домашней кухней и смогут удивить даже самых требовательных гурманов.",
        "Нас выбирают крупнейшие компании за высокое качество и индивидуальный подход. В век массмаркета особую ценность приобретают подарки, сделанные вручную и с душой. Мы нанесем Ваш съедобный логотип на любое угощение."
    ]

    // MARK: - app life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "AKWhite")

        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.register(AKAboutPageCell.self,
                                forCellReuseIdentifier: AKAboutPageCell.reuseIdentifier)
    }

    // MARK: - set up cells

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.images.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AKAboutPageCell.reuseIdentifier, for: indexPath)

        (cell as? AKAboutPageCell)?.setCellData(image: self.images[indexPath.row] ?? #imageLiteral(resourceName: "strawberryPieImage"),
                                                imageName: self.titles[indexPath.row],
                                                imageDescription: self.descriptions[indexPath.row])
        cell.backgroundColor = #colorLiteral(red: 0.948936522, green: 0.9490728974, blue: 0.9489069581, alpha: 1)
        return cell
    }

}
