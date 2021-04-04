//
//  TMMenuVC.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 3.04.21.
//

import TTGTagCollectionView
import UIKit

struct CustomData {
    var title: String
    var image: UIImage
    var url: String
}

class TMMenuVC: UIViewController {

    let data = [
        CustomData(title: "Торты в Мозыре", image: #imageLiteral(resourceName: "bigFruitCakeImage"), url: "google.com"),
        CustomData(title: "На ДР", image: #imageLiteral(resourceName: "medovikCakeImage"), url: "google.com"),
        CustomData(title: "Торты для детей", image: #imageLiteral(resourceName: "bigFruitCakeImage"), url: "google.com"),
        CustomData(title: "Учителю", image: #imageLiteral(resourceName: "medovikCakeImage"), url: "google.com"),
        CustomData(title: "Наборы", image: #imageLiteral(resourceName: "bigFruitCakeImage"), url: "google.com"),
        CustomData(title: "Пироги", image: #imageLiteral(resourceName: "bigFruitCakeImage"), url: "google.com"),
        CustomData(title: "Любимым", image: #imageLiteral(resourceName: "medovikCakeImage"), url: "google.com"),
        CustomData(title: "Торты в Мозыре", image: #imageLiteral(resourceName: "bigFruitCakeImage"), url: "google.com")

    ]

    // MARK: - gui variables

    private lazy var tagsCollectionView: TTGTextTagCollectionView = {
        let tags = TTGTextTagCollectionView()
        let textTagConfig = TTGTextTagConfig()
        textTagConfig.backgroundColor = .systemBlue
        textTagConfig.textColor = .white
        tags.addTags(["Торт", "Десерт", "Подарок", "Пирог", "Наборы", "Десерты детства", "На День Рождения", "Любимому человеку"], with: textTagConfig)
        tags.scrollDirection = .horizontal
        tags.showsHorizontalScrollIndicator = false
        tags.alignment = .left
        tags.delegate = self
        return tags
    }()

    private var tagSelections = [String]()

    private lazy var storiesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Меню"

        self.view.backgroundColor = .white

        view.addSubview(tagsCollectionView)

        self.view.addSubview(storiesCollectionView)
        self.storiesCollectionView.backgroundColor = .white
        self.storiesCollectionView.delegate = self
        self.storiesCollectionView.dataSource = self

        self.setUpConstraints()
    }

    // MARK: - set up constraints

    func setUpConstraints() {

        self.tagsCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(15)
            make.width.equalTo(500)
            make.height.equalTo(40)
        }

        self.storiesCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(70)
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(400)
            make.height.equalTo(130)
        }
    }
}

class CustomCell: UICollectionViewCell {

    var data: CustomData? {
        didSet {
            guard let data = data else { return }
            storiesImageView.image = data.image
            storiesTitle.text = data.title
        }
    }

    private lazy var colorCircleStoriesView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemOrange
        view.layer.cornerRadius = 46
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private lazy var whiteCircleStoriesView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 43
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var storiesImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 40
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private lazy var storiesTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(colorCircleStoriesView)
        contentView.addSubview(whiteCircleStoriesView)
        contentView.addSubview(storiesImageView)
        contentView.addSubview(storiesTitle)
        storiesImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        storiesImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        storiesImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        storiesImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        self.storiesTitle.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.storiesImageView)
            make.top.equalTo(self.storiesImageView.snp.bottom).offset(10)
        }

        self.colorCircleStoriesView.snp.makeConstraints { (make) in
            make.size.equalTo(92)
            make.centerX.equalTo(self.storiesImageView.snp.centerX)
            make.centerY.equalTo(self.storiesImageView.snp.centerY)
        }

        self.whiteCircleStoriesView.snp.makeConstraints { (make) in
            make.size.equalTo(86)
            make.centerX.equalTo(self.storiesImageView.snp.centerX)
            make.centerY.equalTo(self.storiesImageView.snp.centerY)
        }

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - extensions

extension TMMenuVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //        return CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.width / 2)
        return CGSize(width: 80, height: 80)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        if let cell = cell as? CustomCell {
            cell.data = self.data[indexPath.row]
        }

        return cell
    }
}

extension TMMenuVC: TTGTextTagCollectionViewDelegate {
    func textTagCollectionView(_ textTagCollectionView: TTGTextTagCollectionView!, didTapTag tagText: String!, at index: UInt, selected: Bool, tagConfig config: TTGTextTagConfig!) {
        tagSelections.append(tagText)
        print(tagSelections)
    }
}
