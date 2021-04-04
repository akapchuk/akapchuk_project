//
//  TMDeliveryViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 6.03.21.
//

import UIKit
import Lottie

class TMDeliveryViewController: UIViewController {

    private lazy var animationView: AnimationView = {
        let animation = AnimationView()
        animation.animation = Animation.named("delivery.map")
        animation.contentMode = .scaleAspectFit
        animation.loopMode = .playOnce
        animation.play()
        return animation
    }()

    // MARK: - gui variables

    private lazy var mapOrListSegmentedControl: UISegmentedControl = {
        let items = ["Список", "На карте"]
        let itemsPics = [UIImage(systemName: "list.bullet"), UIImage(systemName: "map")]

        let controller = UISegmentedControl(items: itemsPics)
        controller.selectedSegmentIndex = 0
        controller.layer.cornerRadius = 9
        controller.layer.borderWidth = 1
        controller.layer.masksToBounds = true
        controller.selectedSegmentTintColor = UIColor(named: "AKOrange")
        controller.layer.borderColor = UIColor(named: "AKDarkGray")?.cgColor
        controller.addTarget(self, action: #selector(handleSegmentValueChanged(_:)), for: .valueChanged)
        controller.translatesAutoresizingMaskIntoConstraints = false
        return controller
    }()

    private lazy var deliveryTypeHeaderTitleLabel: AKHeaderTitleLabel = {
        let header = AKHeaderTitleLabel()
        header.text = "Список"
        return header
    }()

    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Доставка"

        self.view.backgroundColor = .white

        self.view.addSubview(mapOrListSegmentedControl)
        self.view.addSubview(deliveryTypeHeaderTitleLabel)
        self.view.addSubview(animationView)

        self.setUpConstraints()

    }

    // MARK: - set up constraints

    fileprivate func setUpConstraints() {

        self.mapOrListSegmentedControl.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(10)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(35)
        }

        self.deliveryTypeHeaderTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.mapOrListSegmentedControl.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(20)
        }

        self.animationView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.size.equalTo(200)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
    }

    // MARK: - actions

    @objc func handleSegmentValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("Selected the list")
            self.deliveryTypeHeaderTitleLabel.text = "Список"
        case 1:
            print("Selected the map")
            self.deliveryTypeHeaderTitleLabel.text = "На карте"
        default:
            print("Default")
        }
    }
}
