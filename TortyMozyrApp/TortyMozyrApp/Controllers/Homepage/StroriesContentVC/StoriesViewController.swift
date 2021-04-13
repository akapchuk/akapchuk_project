//
//  StoriesViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 13.04.21.
//

import UIKit

class StoriesViewController: UIViewController {

    // MARK: - gui variables

    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "launchScreen")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - app life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(backgroundImageView)

        self.setUpConstraints()
        self.storiesEnded()
    }

    // MARK: - set up constraints

    private func setUpConstraints() {
        self.backgroundImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

    func storiesEnded() {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            self.navigationController?.pushViewController(TMHomepageViewController(), animated: true)
        }
    }

}
