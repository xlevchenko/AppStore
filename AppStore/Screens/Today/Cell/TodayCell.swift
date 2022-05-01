//
//  TodayCell.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/25/22.
//

import UIKit

class TodayCell: BaseTodayCell {
    
    override var todayItem: TodayResult! {
        didSet {
            categoryLabel.text = todayItem.categoty
            titleLabel.text = todayItem.title
            imageView.image = todayItem.image
            descriptionLabel.text = todayItem.description
            backgroundColor = todayItem.backgroundColor
            
        }
    }
    
    let categoryLabel = TitleLable(text: "Game", textAlignment: .left, fontSize: 20)
    let titleLabel = TitleLable(text: "Angry Birds", textAlignment: .left, fontSize: 28)
    let imageView = UIImageView(image: UIImage(named: "frieds"))
    let descriptionLabel = DescriptionLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 16
        clipsToBounds = true
        descriptionLabel.text = "Angry Birds is a 2009 casual puzzle video game developed by Rovio Entertainment."
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 3
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var topConstraint: NSLayoutConstraint!
    
    func configure() {
        addSubview(imageView)
        imageView.contentMode = .scaleToFill
        
        let imageContainerView = UIView()
        imageContainerView.addSubview(imageView)
        imageView.centerInSuperview(size: .init(width: 270, height: 230))
        
        let stackView = VerticalStackView(arrangedSubviews: [categoryLabel, titleLabel, imageContainerView, descriptionLabel], spacing: 5)
        addSubview(stackView)
        stackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 24, bottom: 24, right: 24))
        self.topConstraint = stackView.topAnchor.constraint(equalTo: topAnchor, constant: 24)
        self.topConstraint.isActive = true
    }
}
