//
//  HomepageViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 5.03.21.
//

import UIKit
import youtube_ios_player_helper

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
    var percent: String
}

struct CustomVideosData {
    var title: String
    var id: String

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
        CustomPromotionsData(title: "На все пироги", image: #imageLiteral(resourceName: "strawberryPieImage"), url: "google.com", color: .purple, percent: "-10%"),
        CustomPromotionsData(title: "На каждый 5-й торт", image: #imageLiteral(resourceName: "medovikSecondImage"), url: "google.com", color: .systemGreen, percent: "-25%"),
        CustomPromotionsData(title: "Весь Май", image: #imageLiteral(resourceName: "trubochkiSecondImage"), url: "google.com", color: .magenta, percent: "-5%")
    ]

    let videosData = [
        CustomVideosData(title: "Первое видео", id: "D5tdtncYeXs"),
        CustomVideosData(title: "Второе видео", id: "hpikLBH8B88"),
        CustomVideosData(title: "Третье видео", id: "isIgQQG2gHQ")
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

    private lazy var videosHeaderTitleLabel: AKHeaderTitleLabel = {
        let header = AKHeaderTitleLabel()
        header.text = "Посмотреть"
        return header
    }()

    private lazy var videosCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(AKVideoCell.self, forCellWithReuseIdentifier: "cellVideo")
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

        self.title = "Главная"

        // NavController customize
        self.navigationItem.setRightBarButton(rightBarButtonItem, animated: true)
        self.navigationItem.setLeftBarButton(leftBarButtonItem, animated: true)
        self.navigationItem.backButtonTitle = " "

        self.mainView.addSubview(storiesCollectionView)
        self.mainView.addSubview(storiesHeaderTitleLabel)
        self.mainView.addSubview(actualHeaderTitleLabel)
        self.mainView.addSubview(actualImageView)
        self.mainView.addSubview(promotionsHeaderTitleLabel)
        self.mainView.addSubview(promotionsCollectionView)
        self.mainView.addSubview(videosHeaderTitleLabel)
        self.mainView.addSubview(videosCollectionView)

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
            make.top.equalTo(self.storiesCollectionView.snp.bottom).offset(40)
            make.left.right.equalToSuperview().inset(20)
        }

        self.actualImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.actualHeaderTitleLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(150)
        }

        self.promotionsHeaderTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.actualImageView.snp.bottom).offset(40)
            make.left.right.equalToSuperview().inset(20)
        }

        self.promotionsCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.promotionsHeaderTitleLabel.snp.bottom).offset(5)
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(130)
            //            make.bottom.equalToSuperview() // опасная штука
        }

        self.videosHeaderTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.promotionsCollectionView.snp.bottom).offset(40)
            make.left.right.equalToSuperview().inset(20)
        }

        self.videosCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.videosHeaderTitleLabel.snp.bottom).offset(5)
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(150)
            make.bottom.equalToSuperview().offset(-20) // опасная штука
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
        } else if collectionView == self.promotionsCollectionView {
            return CGSize(width: 300, height: 130)
        } else {
            return CGSize(width: 300, height: 150)
        }

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if collectionView == self.storiesCollectionView {
            return self.storiesData.count
        } else if collectionView == self.promotionsCollectionView {
            return self.promotionsData.count
        } else {
            return self.videosData.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == self.storiesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            if let cell = cell as? AKStoriesCell {
                cell.storiesData = self.storiesData[indexPath.row]
            }

            return cell
        } else if collectionView == self.promotionsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellPromo", for: indexPath)
            if let cell = cell as? AKPromotionsCell {
                cell.promotionsData = self.promotionsData[indexPath.row]
            }

            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellVideo", for: indexPath)
            if let cell = cell as? AKVideoCell {
                cell.videosData = self.videosData[indexPath.row]
            }

            return cell
        }

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case self.storiesCollectionView:
            self.navigationController?.pushViewController(AKSorryPageViewController(), animated: true)
        case self.promotionsCollectionView:
            self.navigationController?.pushViewController(AKSorryPageViewController(), animated: true)
        default:
            break
        }
    }
}
