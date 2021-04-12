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
        text.text = "Мы упорно трудимся над созданием этой страницы. Уже совсем скоро вы сможете любоваться ею. Благодарим за понимание, вы великолепны!"
        return text
    }()

    private lazy var lottieAnimationView: AnimationView = {
        let animation = AnimationView()
        animation.animation = Animation.named("cat")
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
            make.top.equalToSuperview().offset(20)
        }

        self.lottieAnimationView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
    }

}
