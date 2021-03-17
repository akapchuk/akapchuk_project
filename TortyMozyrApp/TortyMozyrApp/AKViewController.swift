//
//  AKViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 17.03.21.
//

import UIKit

class AKViewController: UIViewController {

    private lazy var mainScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.contentInsetAdjustmentBehavior = .never
        scroll.backgroundColor = .clear
        return scroll
    }()

    private(set) lazy var mainView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(mainScrollView)
        self.mainScrollView.addSubview(mainView)

        self.mainScrollView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }

        self.mainView.snp.makeConstraints { (make) in
            make.edges.width.equalToSuperview()

        }

    }

    
}
