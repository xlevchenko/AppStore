//
//  ReviewCell.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/12/22.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    
    let titleLabel = TitleLable(text: "Review & Reting", textAlignment: .left, fontSize: 18)
    let authorLabel = SecondaryTitleLable(text: "Olexsi Levchenko", fontSize: 16)
    let starLabel = TitleLable(text: "Stars", textAlignment: .left, fontSize: 14)
    let bodyLabel = TitleLable(text: "Body Label\nBody Label\nBody Label\nBody Label\n", textAlignment: .left, fontSize: 16)
    
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
        bodyLabel.font = UIFont.systemFont(ofSize: 14)
        bodyLabel.numberOfLines = 0
        
        let stackView = VerticalStackView(arrangedSubviews: [
            UIStackView(arrangedSubviews: [titleLabel, UIView(), authorLabel]),
            starLabel,
            bodyLabel
        ], spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20 ))
    }
}
