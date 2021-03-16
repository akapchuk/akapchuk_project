//
//  HomepageViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 5.03.21.
//

import UIKit

class TMHomepageViewController: UIViewController {

    // MARK: - gui variables

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0,
                                                    y: 0,
                                                    width: self.view.frame.size.width,
                                                    height: self.view.frame.size.height))
        scrollView.backgroundColor = UIColor(named: "AKWhite")
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 2200)
        return scrollView
    }()

    private lazy var storiesHeaderTitleLabel: AKHeaderTitleLabel = {
        let header = AKHeaderTitleLabel()
        header.text = "Истории"
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // NavController customize
        self.title = "Главная"
        self.navigationItem.setRightBarButton(rightBarButtonItem, animated: true)
        self.navigationItem.setLeftBarButton(leftBarButtonItem, animated: true)

        self.view.addSubview(scrollView)
        self.scrollView.addSubview(storiesHeaderTitleLabel)
        
        self.setUpConstraints()
    }
    
    func setUpConstraints() {

        NSLayoutConstraint.activate([
            self.storiesHeaderTitleLabel.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 10),
            self.storiesHeaderTitleLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 20)
        ])
    }

}
