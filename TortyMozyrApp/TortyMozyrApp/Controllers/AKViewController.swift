//
//  AKViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 17.03.21.
//

import UIKit

class AKViewController: UIViewController {

    // MARK: - gui variables

    private(set) lazy var mainScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.contentInsetAdjustmentBehavior = .never
        scroll.keyboardDismissMode = .onDrag
        scroll.backgroundColor = .clear
        return scroll
    }()

    private(set) lazy var mainView = UIView()

    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(mainScrollView)
        self.mainScrollView.addSubview(mainView)

        self.mainScrollView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
        }

        self.setContentScrolling(isEnabled: true)
    }

    // MARK: - set content scrolling

    func setContentScrolling(isEnabled: Bool) {
        self.mainView.snp.remakeConstraints { (make) in
            make.edges.width.equalToSuperview()
            if !isEnabled {
                make.height.equalToSuperview()
            }
        }
    }
}
