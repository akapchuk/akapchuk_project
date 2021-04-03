//
//  TMMenuVC.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 3.04.21.
//

import UIKit

struct CustomData {
    var title: String
    var image: UIImage
    var url: String
}

class TMMenuVC: UIViewController {

    let data = [
        CustomData(title: "Hello world", image: #imageLiteral(resourceName: "bigFruitCakeImage"), url: "google.com"),
        CustomData(title: "Hello world", image: #imageLiteral(resourceName: "medovikCakeImage"), url: "google.com"),
        CustomData(title: "Hello world", image: #imageLiteral(resourceName: "bigFruitCakeImage"), url: "google.com"),
        CustomData(title: "Hello world", image: #imageLiteral(resourceName: "medovikCakeImage"), url: "google.com"),
        CustomData(title: "Hello world", image: #imageLiteral(resourceName: "bigFruitCakeImage"), url: "google.com"),
        CustomData(title: "Hello world", image: #imageLiteral(resourceName: "bigFruitCakeImage"), url: "google.com"),
        CustomData(title: "Hello world", image: #imageLiteral(resourceName: "medovikCakeImage"), url: "google.com"),
        CustomData(title: "Hello world", image: #imageLiteral(resourceName: "bigFruitCakeImage"), url: "google.com")

    ]

    // MARK: - gui variables

    private lazy var storiesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
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

        self.view.addSubview(storiesCollectionView)
        self.storiesCollectionView.backgroundColor = .white
        self.storiesCollectionView.delegate = self
        self.storiesCollectionView.dataSource = self

        self.setUpConstraints()
    }

    // MARK: - set up constraints

    func setUpConstraints() {

        self.storiesCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(15)
            make.left.equalToSuperview().offset(10)
//            make.width.equalTo(400)
//            make.height.equalTo(storiesCollectionView.snp.width).multipliedBy(0.5)
            make.width.equalTo(400)
            make.height.equalTo(150)
        }
    }
}

// MARK: - extensions

extension TMMenuVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.width / 2)
        return CGSize(width: 100, height: 100)
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

class CustomCell: UICollectionViewCell {

    var data: CustomData? {
        didSet {
            guard let data = data else { return }
            bg.image = data.image
        }
    }

    private lazy var bg: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 50
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
