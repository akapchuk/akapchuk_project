//
//  AKYoutubeTest050421VC.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 5.04.21.
//

import UIKit
import youtube_ios_player_helper

class AKYoutubeTest050421VC: UIViewController {

    private lazy var playerView: YTPlayerView = {
        let view = YTPlayerView()
        view.backgroundColor = .black
        view.load(withVideoId: "5qap5aO4i9A")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white

        self.view.addSubview(playerView)

        self.setUpConstraints()
    }

    func setUpConstraints() {
        self.playerView.snp.makeConstraints { (make) in
            make.height.equalTo(300)
            make.width.equalTo(UIScreen.main.bounds.width)
            make.center.equalToSuperview()
        }
    }

}
