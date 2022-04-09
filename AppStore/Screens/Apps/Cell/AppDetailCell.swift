//
//  AppDetailCell.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/9/22.
//

import UIKit

class AppDetailCell: UICollectionViewCell {
    
    let appIconImageView = IconImageView(frame: .zero)
    let nameLable = TitleLable(text: "TikTok", textAlignment: .left, fontSize: 16)
    let priceButton = GetButton(frame: .zero)
    let whatsNewLable = TitleLable(text: "What's News", textAlignment: .left, fontSize: 20)
    let releaseNotesLable = TitleLable(text: "Release Notes", textAlignment: .left, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        nameLable.numberOfLines = 2
        
        appIconImageView.backgroundColor = .systemRed
        appIconImageView.constrainWidth(constant: 140)
        appIconImageView.constrainHeight(constant: 140)
        
        priceButton.constrainHeight(constant: 32)
        priceButton.constrainWidth(constant: 80)
        priceButton.setTitleColor(.white, for: .normal)
        priceButton.backgroundColor = .systemBlue
    }
    
    func configureStackView() {
        let stackView =
        VerticalStackView(arrangedSubviews: [UIStackView(arrangedSubviews: [appIconImageView, VerticalStackView(arrangedSubviews: [nameLable, UIStackView(arrangedSubviews: [priceButton, UIView()]), UIView()], spacing: 12)], customSpacing: 20), whatsNewLable, releaseNotesLable], spacing: 16)
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
}


extension UIStackView {
    convenience init(arrangedSubviews: [UIView], customSpacing: CGFloat = 0) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.spacing = customSpacing
    }
}
