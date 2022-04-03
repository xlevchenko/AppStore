//
//  AppsCell.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 3/31/22.
//

import UIKit

class AppsCell: UICollectionViewCell {
    
    static let appReuseID      = "appCell"
    
    let titleLabel = AppTitleLable(text: "App Section", textAlignment: .left, fontSize: 25)
    
    let horizontalController = AppsHorizontalVC()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStackView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureStackView() {
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        
        addSubview(horizontalController.view)
        horizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
}
