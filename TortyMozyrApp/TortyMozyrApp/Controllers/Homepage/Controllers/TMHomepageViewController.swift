//
//  HomepageViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 5.03.21.
//

import UIKit
import youtube_ios_player_helper

class TMHomepageViewController: AKViewController {

    // MARK: - properties

    let storiesData = [
        CustomStoriesData(title: "Merengue".localized,
                          image: UIImage(named: "merengueRollImage"),
                          url: "google.com",
                          storiesContenImage: "merenRuletStoriesImage"),

        CustomStoriesData(title: "Birthday".localized,
                          image: UIImage(named: "numbersCake"),
                          url: "google.com",
                          storiesContenImage: "medovikBirthdayStoriesImage"),

        CustomStoriesData(title: "Cakes for children".localized,
                          image: UIImage(named: "blackberryCakeImage"),
                          url: "google.com",
                          storiesContenImage: "merenRuletStoriesImage"),

        CustomStoriesData(title: "For teacher".localized,
                          image: UIImage(named: "fruitCakeImage"),
                          url: "google.com",
                          storiesContenImage: "medovikBirthdayStoriesImage"),

        CustomStoriesData(title: "Sets".localized,
                          image: UIImage(named: "setsNYImage"),
                          url: "google.com",
                          storiesContenImage: "merenRuletStoriesImage"),

        CustomStoriesData(title: "Cakes in Mozyr".localized,
                          image: UIImage(named: "napoleonCakeImage"),
                          url: "google.com",
                          storiesContenImage: "medovikBirthdayStoriesImage"),

        CustomStoriesData(title: "Pies".localized,
                          image: UIImage(named: "strawberryPieImage"),
                          url: "google.com",
                          storiesContenImage: "merenRuletStoriesImage"),

        CustomStoriesData(title: "Cupcakes".localized,
                          image: UIImage(named: "cupcakeImage"),
                          url: "google.com",
                          storiesContenImage: "medovikBirthdayStoriesImage")
    ]

    private let edgeInsets: UIEdgeInsets =  UIEdgeInsets(top: 20, left: 20, bottom: 40, right: 20)
    private let imageSize =  CGSize(width: 50, height: 50)

    // MARK: - gui variables

    private lazy var storiesHeaderTitleLabel: AKHeaderTitleLabel = {
        let header = AKHeaderTitleLabel()
        header.text = "Stories".localized
        return header
    }()

    private lazy var storiesCollectionView: AKHorizontalCollectionView = {
        let cv = AKHorizontalCollectionView(frame: .zero,
                                            collectionViewLayout: AKHorizontalCollectionViewLayout())

        cv.register(AKStoriesCell.self,
                    forCellWithReuseIdentifier: AKStoriesCell.reuseIdentifier)

        cv.delegate = self
        cv.dataSource = self
        return cv
    }()

    private lazy var actualHeaderTitleLabel: AKHeaderTitleLabel = {
        let header = AKHeaderTitleLabel()
        header.text = "Actual".localized
        return header
    }()

    private lazy var actualImageView: AKImageView = {
        let image = AKImageView()
        image.image = UIImage(named: "bigFruitCakeImage")
        image.layer.cornerRadius = 15
        image.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                          action: #selector(actualImageWasTapped)))
        return image
    }()

    private lazy var actualActionButton: AKSystemButton = {
        let button = AKSystemButton()
        button.backgroundColor = AKColors.orange
        button.setTitle("Смотреть", for: .normal)
        return button
    }()

    private lazy var promotionsHeaderTitleLabel: AKHeaderTitleLabel = {
        let header = AKHeaderTitleLabel()
        header.text = "Discounts".localized
        return header
    }()

    private lazy var promotionsCollectionView: AKHorizontalCollectionView = {
        let cv = AKHorizontalCollectionView(frame: .zero, collectionViewLayout:
                                                AKHorizontalCollectionViewLayout())

        cv.register(AKPromotionsCell.self, forCellWithReuseIdentifier: AKPromotionsCell.reuseIdentifier)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()

    private lazy var videosHeaderTitleLabel: AKHeaderTitleLabel = {
        let header = AKHeaderTitleLabel()
        header.text = "Watch".localized
        return header
    }()

    private lazy var videosCollectionView: AKHorizontalCollectionView = {
        let cv = AKHorizontalCollectionView(frame: .zero,
                                            collectionViewLayout: AKHorizontalCollectionViewLayout())

        cv.register(AKVideoCell.self, forCellWithReuseIdentifier: AKVideoCell.reuseIdentifier)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()

    private lazy var rightBarButtonItem: UIBarButtonItem = {
        let barButton = UIBarButtonItem(barButtonSystemItem: .add,
                                     target: self,
                                     action: #selector(addBarButtonTapped))
        return barButton
    }()

    // MARK: - app life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = AKColors.white

        self.title = "Homepage".localized

        self.navigationItem.setRightBarButton(rightBarButtonItem, animated: true)
        self.navigationItem.backButtonTitle = " "

        self.mainView.addSubview([
            self.storiesHeaderTitleLabel,
            self.storiesCollectionView,
            self.actualHeaderTitleLabel,
            self.actualImageView,
            self.promotionsHeaderTitleLabel,
            self.promotionsCollectionView,
            self.videosHeaderTitleLabel,
            self.videosCollectionView
        ])

        self.actualImageView.addSubview(self.actualActionButton)

        self.setUpConstraints()
    }

    // MARK: - set up constraints

    func setUpConstraints() {

        self.storiesHeaderTitleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.right.equalToSuperview().inset(self.edgeInsets) // snapkit is kind
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

        self.actualActionButton.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.bottom.equalToSuperview().inset(10)
        }

        self.promotionsHeaderTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.actualImageView.snp.bottom).offset(40)
            make.left.right.equalToSuperview().inset(self.edgeInsets)
        }

        self.promotionsCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.promotionsHeaderTitleLabel.snp.bottom).offset(5)
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(130)
        }

        self.videosHeaderTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.promotionsCollectionView.snp.bottom).offset(40)
            make.left.right.equalToSuperview().inset(self.edgeInsets)
        }

        self.videosCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.videosHeaderTitleLabel.snp.bottom).offset(5)
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(150)
            make.bottom.equalToSuperview().offset(-20)
        }

    }

    // MARK: - actions

    @objc private func actualImageWasTapped() {
        self.navigationController?.pushViewController(AKActualTableViewController(), animated: true)
    }

    @objc private func addBarButtonTapped() {
        self.navigationController?.pushViewController(AKCreateCustomOrderViewController(), animated: true)
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
            return storiesData.count
        } else if collectionView == self.promotionsCollectionView {
            return promotionsData.count
        } else {
            return videosData.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == self.storiesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AKStoriesCell.reuseIdentifier, for: indexPath)
            if let cell = cell as? AKStoriesCell {
                cell.set(data: storiesData[indexPath.row])

                cell.showStories = { [weak self] in
                    let string = self?.storiesData[indexPath.row].storiesContenImage

                    let controller = StoriesViewController(imageString: string ?? "launchScreen")
                    self?.navigationController?.pushViewController(controller, animated: true)

                }
            }

            return cell
        } else if collectionView == self.promotionsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AKPromotionsCell.reuseIdentifier, for: indexPath)
            if let cell = cell as? AKPromotionsCell {
                cell.set(data: promotionsData[indexPath.row])
            }

            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AKVideoCell.reuseIdentifier, for: indexPath)
            if let cell = cell as? AKVideoCell {
                cell.set(data: videosData[indexPath.row])
            }

            return cell
        }

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case self.storiesCollectionView:
            self.navigationController?.pushViewController(StoriesViewController(imageString: self.storiesData[indexPath.row].storiesContenImage), animated: true)
        case self.promotionsCollectionView:
            self.navigationController?.pushViewController(AKSorryPageViewController(), animated: true)
        default:
            break
        }
    }
}
