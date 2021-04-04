//
//  HomepageViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 5.03.21.
//

import UIKit

struct CustomStoriesData {
    var title: String
    var image: UIImage
    var url: String
}

class TMHomepageViewController: AKViewController {

    let storiesData = [
        CustomStoriesData(title: "Пироги", image: #imageLiteral(resourceName: "pearPieImage"), url: "google.com"),
        CustomStoriesData(title: "На ДР", image: #imageLiteral(resourceName: "medovikCakeImage"), url: "google.com"),
        CustomStoriesData(title: "Торты для детей", image: #imageLiteral(resourceName: "cupcakeImage"), url: "google.com"),
        CustomStoriesData(title: "Учителю", image: #imageLiteral(resourceName: "trubochkiSecondImage"), url: "google.com"),
        CustomStoriesData(title: "Наборы", image: #imageLiteral(resourceName: "bigFruitCakeImage"), url: "google.com"),
        CustomStoriesData(title: "Торты в Мозыре", image: #imageLiteral(resourceName: "krasniyBarhatImage"), url: "google.com"),
        CustomStoriesData(title: "Любимым", image: #imageLiteral(resourceName: "fruitCakeImage"), url: "google.com"),
        CustomStoriesData(title: "Торты в Мозыре", image: #imageLiteral(resourceName: "blackberryCakeImage"), url: "google.com")
    ]

    // MARK: - gui variables

    private lazy var storiesHeaderTitleLabel: AKHeaderTitleLabel = {
        let header = AKHeaderTitleLabel()
        header.text = "Истории"
        return header
    }()

    private lazy var storiesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(AKStoriesCell.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = .clear
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()

    private lazy var actualHeaderTitleLabel: AKHeaderTitleLabel = {
        let header = AKHeaderTitleLabel()
        header.text = "Акутальное"
        return header
    }()

    private lazy var actualImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "medovikSecondImage")
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actualImageWasTapped)))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var promotionsHeaderTitleLabel: AKHeaderTitleLabel = {
        let header = AKHeaderTitleLabel()
        header.text = "Акции"
        return header
    }()

    private lazy var rightBarButtonItem: UIBarButtonItem = {
        let barButton = UIBarButtonItem(systemItem: .search)
        return barButton
    }()

    private lazy var leftBarButtonItem: UIBarButtonItem = {
        let barButton = UIBarButtonItem(systemItem: .add)
        return barButton
    }()

    // MARK: - app life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "AKWhite")

        // NavController customize
        self.title = "Главная"
        self.navigationItem.setRightBarButton(rightBarButtonItem, animated: true)
        self.navigationItem.setLeftBarButton(leftBarButtonItem, animated: true)

        self.view.addSubview(storiesCollectionView)
        self.mainView.addSubview(storiesHeaderTitleLabel)
        self.mainView.addSubview(actualHeaderTitleLabel)
        self.view.addSubview(actualImageView) // ⚠️
        self.mainView.addSubview(promotionsHeaderTitleLabel)

        self.setUpConstraints()
    }

    // MARK: - set up constraints

    func setUpConstraints() {

        self.storiesHeaderTitleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.right.equalToSuperview().inset(20)
        }

        self.storiesCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.storiesHeaderTitleLabel.snp.bottom).inset(15)
            make.left.equalToSuperview()
            make.width.equalTo(400)
            make.height.equalTo(130)
        }

        self.actualHeaderTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.storiesCollectionView.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(20)
        }

        self.actualImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.actualHeaderTitleLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(150)
        }

        self.promotionsHeaderTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.actualImageView.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(20)
        }

    }

    // MARK: - actions

    @objc func actualImageWasTapped() {
        self.navigationController?.pushViewController(AKActualTableViewController(), animated: true)
    }

}

// MARK: - extensions

extension TMHomepageViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //        return CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.width / 2)
        return CGSize(width: 70, height: 70)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.storiesData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        if let cell = cell as? AKStoriesCell {
            cell.storiesData = self.storiesData[indexPath.row]
        }

        return cell
    }
}
