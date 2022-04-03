//
//  SeachResultCell.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 3/23/22.
//

import UIKit

class SeachResultCell: UICollectionViewCell {
    
    static let reuseID      = "searchCell"
    
    let appIconImageView    = AppIconImageView(frame: .zero)
    var nameLable           = AppTitleLable(text: "", textAlignment: .left, fontSize: 18)
    var categoryLable       = AppSecondaryLable(text: "", fontSize: 15)
    var ratingsLable        = AppSecondaryLable(text: "", fontSize: 14)
    let getButton           = GetButton(type: .system)
    
    let screenshot1         = ScreenshotView(frame: .zero)
    let screenshot2         = ScreenshotView(frame: .zero)
    let screenshot3         = ScreenshotView(frame: .zero)

    var appResult: Result! {
        didSet {
            nameLable.text      = appResult.trackName
            categoryLable.text  = appResult.primaryGenreName
            ratingsLable.text   = String("\(appResult.averageUserRating)")
            
            
            appIconImageView.sd_setImage(with: URL(string: appResult.artworkUrl100))
            screenshot1.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
            
            if appResult.screenshotUrls.count > 1 {
            screenshot2.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
            }
            
            if appResult.screenshotUrls.count > 2 {
            screenshot3.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStackView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
