//
//  AppsHeaderCell.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/3/22.
//

import UIKit

class AppsSocialHeaderCell: UICollectionViewCell {
    
    let companyLable = TitleLable(text: "Facebook", textAlignment: .left, fontSize: 12)
    let titleLable = TitleLable(text: "Canva: Design, Photo & Video", textAlignment: .left, fontSize: 18)
    let categoryLable = SecondaryTitleLable(text: "Create beautiful designs", fontSize: 17)
    let imageView = ScreenshotImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureStackView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() {
        companyLable.textColor = .systemBlue
        titleLable.font = .systemFont(ofSize: 20)
        titleLable.numberOfLines = 2
    }
    
    
    func configureStackView() {
        let stackView = VerticalStackView(arrangedSubviews: [companyLable, titleLable, categoryLable, imageView])
        addSubview(stackView)
        stackView.spacing = 5
        stackView.fillSuperview(padding: .init(top: 0, left: 16, bottom: 0, right: 4))
    }
}
