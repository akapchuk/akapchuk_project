//
//  StoriesViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 13.04.21.
//

import UIKit

class StoriesViewController: UIViewController {

    // MARK: - gui variables

    private lazy var storiesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "launchScreen")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var loadingView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - app life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(storiesImageView)
        self.storiesImageView.addSubview(loadingView)

        self.navigationController?.navigationBar.isHidden = true

        self.setUpConstraints()
        self.storiesEnded()
        self.scale()
    }

    // MARK: - set up constraints

    private func setUpConstraints() {

        self.storiesImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        self.loadingView.snp.makeConstraints { (make) in
            make.size.equalTo(5)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(10)
            make.left.equalToSuperview()
        }
    }

    private func storiesEnded() {
        Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { _ in
            self.navigationController?.navigationBar.isHidden = false
            self.navigationController?.pushViewController(TMHomepageViewController(), animated: true)
        }

    }

    func scale() {
        UIView.animate(withDuration: 10, delay: 0, options: [.curveEaseIn]) {
            self.loadingView.transform = CGAffineTransform(scaleX: 160, y: 1)
        }
    }

}
