//
//  SeachResultCell.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 3/23/22.
//

import UIKit

class SeachResultCell: UICollectionViewCell {
    
    static let reuseID      = "searchCell"
    
    let appIconImageView    = AvatarImageView(frame: .zero)
    let nameLable           = AppTitleLable(textAlignment: .left, fontSize: 18)
    let categoryLable       = AppSecondaryLable(fontSize: 15)
    let ratingsLable        = AppSecondaryLable(fontSize: 14)
    let getButton           = GetButton(type: .system)
    
    let screenshot1         = ScreenshotView(frame: .zero)
    let screenshot2         = ScreenshotView(frame: .zero)
    let screenshot3         = ScreenshotView(frame: .zero)

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStackView()
        setText()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setText() {
        nameLable.text      = "Instagram"
        categoryLable.text  = "Photos & Video"
        ratingsLable.text   = "9.13K"
    }

    
    func configureStackView() {
        let lableStackView                  = VerticalStackView(arrangedSubviews: [nameLable, categoryLable, ratingsLable])
        
        let infoStackView                   = UIStackView(arrangedSubviews: [appIconImageView, lableStackView, getButton])
        infoStackView.alignment             = .center
        infoStackView.spacing               = 12
        
        let screenshotStackView             = UIStackView(arrangedSubviews: [screenshot1, screenshot2, screenshot3] )
        screenshotStackView.distribution    = .fillEqually
        screenshotStackView.spacing         = 12
        
        let overallStackView                = VerticalStackView(arrangedSubviews: [infoStackView, screenshotStackView], spacing: 16)
        
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
}
