//
//  AppsCell.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 3/31/22.
//

import UIKit

class AppsCell: UICollectionViewCell {
    
    static let appReuseID      = "appCell"
    
    let titleLabel = AppTitleLable(textAlignment: .left, fontSize: 25)
    
    let horizontalController = AppsHorizontalVC()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        configureStackView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureStackView() {
        addSubview(titleLabel)
        titleLabel.text = "App Section"
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
        
        addSubview(horizontalController.view)
        horizontalController.view.backgroundColor = .systemBlue
        horizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
}
