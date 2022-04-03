//
//  AppsHeaderAppCell.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/3/22.
//

import UIKit

class AppsHeaderAppCell: UICollectionViewCell {
    
    let companyLable = AppTitleLable(text: "Facebook", textAlignment: .left, fontSize: 12)
    let titleLable = AppTitleLable(text: "Canva: Design, Photo & Video", textAlignment: .left, fontSize: 22)
    let categoryLable = AppSecondaryLable(text: "Create beautiful designs", fontSize: 17)
    let imageView = ScreenshotView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStackView()
        imageView.backgroundColor = .red
        companyLable.textColor = .systemBlue
        titleLable.font = .systemFont(ofSize: 22)
        titleLable.numberOfLines = 2
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureStackView() {
        let stackView = VerticalStackView(arrangedSubviews: [companyLable, titleLable, categoryLable, imageView])
        addSubview(stackView)
        stackView.spacing = 5
        stackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 0, right: 0))
        
        
    }
}