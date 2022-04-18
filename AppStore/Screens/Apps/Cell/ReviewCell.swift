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
    let bodyLabel = TitleLable(text: "Body Label\nBody Label\nBody Label\nBody Label\n", textAlignment: .left, fontSize: 16)
    
    let starsStackView: UIStackView = {
        var arrangeSubviews = [UIView]()
        (0..<5).forEach { _ in
            let imageViews = UIImageView(image: UIImage(systemName: "star.fill"))
            imageViews.tintColor = .systemOrange
            arrangeSubviews.append(imageViews)
        }
        let stackView = UIStackView(arrangedSubviews: arrangeSubviews)
        return stackView
    }()
    
    
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
        authorLabel.textAlignment = .right
        bodyLabel.font = UIFont.systemFont(ofSize: 14)
        bodyLabel.numberOfLines = 0
        titleLabel.setContentCompressionResistancePriority(.init(rawValue: 0), for: .horizontal)
        
        let stackView = VerticalStackView(arrangedSubviews: [
            UIStackView(arrangedSubviews: [titleLabel, authorLabel], customSpacing: 8),
            UIStackView(arrangedSubviews: [starsStackView, UIView()]),
            bodyLabel
        ], spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20 ))
    }
}
