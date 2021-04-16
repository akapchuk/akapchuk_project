//
//  AKSorryPageViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 12.04.21.
//

import UIKit
import Lottie

class AKSorryPageViewController: UIViewController {
    
    // MARK: - gui variables
    
    private lazy var messageTitleLabel: AKDescriptionTitleLabel = {
        let text = AKDescriptionTitleLabel()
        text.text = NSLocalizedString("Sorry Message", comment: "")
        return text
    }()

    private lazy var lottieAnimationView: AnimationView = {
        let animation = AnimationView()
        animation.animation = Animation.named("developing")
        animation.contentMode = .scaleAspectFit
        animation.loopMode = .loop
        animation.play()
        return animation
    }()

    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Страница в разработке"
        self.view.backgroundColor = .white

        self.view.addSubview(messageTitleLabel)
        self.view.addSubview(lottieAnimationView)

        self.setUpConstraints()
    }
    // MARK: - set up constraints

    func setUpConstraints() {
        self.messageTitleLabel.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(10)
        }

        self.lottieAnimationView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }

    }

    // MARK: - actions

}
