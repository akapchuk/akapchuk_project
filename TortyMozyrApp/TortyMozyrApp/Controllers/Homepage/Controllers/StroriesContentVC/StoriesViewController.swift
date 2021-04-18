//
//  StoriesViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 13.04.21.
//

import UIKit

class StoriesViewController: UIViewController {

    // MARK: - properties

    private var imageString: String?

    // MARK: - gui variables

    private lazy var storiesImageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(named: "merenRuletStoriesImage")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var loadingView: UIView = {
        let view = UIView()
        view.layer.opacity = 0.8
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var cancelImageView: AKImageView = {
        let image = AKImageView()
        image.layer.opacity = 0.8
        image.tintColor = .white
        image.image = UIImage(systemName: "multiply.circle.fill")
        return image
    }()

    // MARK: - app life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview([
            self.storiesImageView,
            self.cancelImageView
        ])

        self.storiesImageView.addSubview(self.loadingView)

        self.hideAppNavigationBars(true)

        self.setUpConstraints()
        self.storiesEnded()
        self.scale()

        self.cancelImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cancelButtonTapped)))

        self.loadStoriesImage()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        self.hideAppNavigationBars(false)
    }

    // MARK: - initialization

    init(imageString: String) {
        super.init(nibName: nil, bundle: nil)
        self.imageString = imageString
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

        self.cancelImageView.snp.makeConstraints { (make) in
            make.size.equalTo(30)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(20)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(20)
        }
    }

    // MARK: - methods

    fileprivate func hideAppNavigationBars(_ isHide: Bool) {
        self.navigationController?.navigationBar.isHidden = isHide
        self.tabBarController?.tabBar.isHidden = isHide
    }

    private func loadStoriesImage() {
        if let imageString = self.imageString {
            self.storiesImageView.image = UIImage(named: imageString)
        } else {
            self.storiesImageView.image = UIImage(named: "launchScreen")
        }
    }

    // MARK: - actions

    private func storiesEnded() {
        Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { _ in
            self.navigationController?.pushViewController(TMHomepageViewController(), animated: true)
        }

    }

    private func scale() {
        UIView.animate(withDuration: 10, delay: 0, options: [.curveEaseIn]) {
            self.loadingView.transform = CGAffineTransform(scaleX: 160, y: 1)
        }
    }

    @objc private func cancelButtonTapped() {
        self.navigationController?.pushViewController(TMHomepageViewController(), animated: true)
    }

}
