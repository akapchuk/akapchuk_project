//
//  AKAnimationView.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 15.04.21.
//

import Lottie
import UIKit

class AKAnimationView: UIView {

    let view = AnimationView()

    init() {
        super.init(frame: .zero)

        self.setUpView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpView() {
        self.addSubview(self.view)

        self.view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
