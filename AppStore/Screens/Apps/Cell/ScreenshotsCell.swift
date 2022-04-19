//
//  ScreenshotsCell.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/11/22.
//

import UIKit

class ScreenshotsCell: UICollectionViewCell {
    
    let screenshotView = ScreenshotImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        addSubview(screenshotView)
        screenshotView.fillSuperview()
    }
}
