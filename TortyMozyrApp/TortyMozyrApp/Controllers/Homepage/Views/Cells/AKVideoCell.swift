//
//  AKVideoCell.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 11.04.21.
//

import UIKit
import youtube_ios_player_helper

class AKVideoCell: UICollectionViewCell {

    var videosData: CustomVideosData? {
        didSet {
            guard let data = videosData else { return }
            playerView.load(withVideoId: data.id)
        }
    }

    // MARK: - gui variables

    private lazy var playerView: YTPlayerView = {
        let view = YTPlayerView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - cell initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(playerView)

        self.setNeedsUpdateConstraints()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - set up constraints

    override func updateConstraints() {

        self.playerView.snp.updateConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(150)
        }

        super.updateConstraints()
    }

}
