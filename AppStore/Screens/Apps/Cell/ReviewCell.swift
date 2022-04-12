//
//  ReviewCell.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/12/22.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    
    let titleLabel = TitleLable(text: "Review & Reting", textAlignment: .left, fontSize: 16)
    let authorLabel = TitleLable(text: "Olexsi Levchenko", textAlignment: .left, fontSize: 16)
    let starLabel = TitleLable(text: "Stars", textAlignment: .left, fontSize: 14)
    let bodyLabel = TitleLable(text: "Body Label\nBody Label\nBody Label\nBody Label\n", textAlignment: .left, fontSize: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        backgroundColor = .systemGray5
        layer.cornerRadius = 16
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() {
        authorLabel.font = UIFont.systemFont(ofSize: 16)
        starLabel.font = UIFont.systemFont(ofSize: 14)
    }
}
