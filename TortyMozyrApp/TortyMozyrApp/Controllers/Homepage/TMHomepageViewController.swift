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

struct CustomPromotionsData {
    var title: String
    var image: UIImage
    var url: String
    var color: UIColor
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

    let promotionsData = [
        CustomPromotionsData(title: "На все пироги", image: #imageLiteral(resourceName: "strawberryPieImage"), url: "google.com", color: .purple),
        CustomPromotionsData(title: "На каждый 5-й торт", image: #imageLiteral(resourceName: "medovikSecondImage"), url: "google.com", color: .systemGreen),
        CustomPromotionsData(title: "В Мае", image: #imageLiteral(resourceName: "trubochkiSecondImage"), url: "google.com", color: .magenta)
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
        cv.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
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

    private lazy var promotionsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(AKPromotionsCell.self, forCellWithReuseIdentifier: "cellPromo")
        cv.backgroundColor = .clear
        cv.delegate = self
        cv.dataSource = self
        cv.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        return cv
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

        self.mainView.addSubview(storiesCollectionView)
        self.mainView.addSubview(storiesHeaderTitleLabel)
        self.mainView.addSubview(actualHeaderTitleLabel)
        self.mainView.addSubview(actualImageView)
        self.mainView.addSubview(promotionsHeaderTitleLabel)
        self.mainView.addSubview(promotionsCollectionView)

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
            make.left.right.bottom.equalToSuperview().inset(20)
        }

        self.promotionsCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.promotionsHeaderTitleLabel.snp.bottom).offset(5)
            make.width.equalTo(400)
            make.height.equalTo(130)
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

        if collectionView == self.storiesCollectionView {
            return CGSize(width: 80, height: 80)
        } else {
            return CGSize(width: 300, height: 130)
//            return CGSize(width: collectionView.frame.width / 1.3, height: collectionView.frame.width / 3)
        }

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if collectionView == self.storiesCollectionView {
            return self.storiesData.count
        } else {
            return self.promotionsData.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == self.storiesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            if let cell = cell as? AKStoriesCell {
                cell.storiesData = self.storiesData[indexPath.row]
            }

            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellPromo", for: indexPath)
            if let cell = cell as? AKPromotionsCell {
                cell.promotionsData = self.promotionsData[indexPath.row]
            }

            return cell
        }

    }
}
