//
//  TMDeliveryCell.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 14.04.21.
//

import UIKit

class TMDeliveryCell: UICollectionViewCell {
    
    // MARK: - gui variables
    
    private lazy var colorContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var listItemTitle: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.font = UIFont.systemFont(ofSize: 15, weight: .black)
        title.textColor = .white
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    // MARK: - cell initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(colorContainerView)
        self.colorContainerView.addSubview(listItemTitle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - set up constraints
    
    override func updateConstraints() {
        
        self.colorContainerView.snp.updateConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.listItemTitle.snp.updateConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        
        super.updateConstraints()
    }
    
    // MARK: - methods
    
    func set(data: CustomDeliveryListData) {
        self.colorContainerView.backgroundColor = data.color
        self.listItemTitle.text = data.title
        
        self.setNeedsUpdateConstraints()
    }
    
}
