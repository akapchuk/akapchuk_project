//
//  TMDeliveryViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 6.03.21.
//

import UIKit

class TMDeliveryViewController: UIViewController {

    // MARK: - gui variables

    private lazy var mapOrListSegmentedControl: UISegmentedControl = {
        let items = ["Список", "На карте"]
        let itemsPics = [UIImage(systemName: "list.bullet"), UIImage(systemName: "map")]

        let controller = UISegmentedControl(items: itemsPics)
        controller.selectedSegmentIndex = 0
        controller.layer.cornerRadius = 9
        controller.layer.borderWidth = 1
        controller.layer.masksToBounds = true
//        controller.backgroundColor = UIColor(named: "AKBlue")
//        controller.selectedSegmentTintColor = UIColor(named: "AKOrange")
        controller.layer.borderColor = UIColor(named: "AKBlue")?.cgColor
        controller.addTarget(self, action: #selector(handleSegmentValueChanged(_:)), for: .valueChanged)
        controller.translatesAutoresizingMaskIntoConstraints = false
        return controller
    }()


    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Доставка"

        self.view.backgroundColor = UIColor(named: "AKWhite")

        self.view.addSubview(mapOrListSegmentedControl)

        self.setUpConstraints()

    }

    // MARK: - set up constraints

    fileprivate func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.mapOrListSegmentedControl.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.mapOrListSegmentedControl.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 25),
            self.mapOrListSegmentedControl.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -25),
            self.mapOrListSegmentedControl.heightAnchor.constraint(equalToConstant: 35)
        ])
    }

    // MARK: - actions

    @objc func handleSegmentValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("Selected the list")
        case 1:
            print("Selected the map")
        default:
            print("Default")
        }
    }


}
