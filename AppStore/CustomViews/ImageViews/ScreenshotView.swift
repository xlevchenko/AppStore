//
//  ScreenshotView.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 3/25/22.
//

import UIKit

class ScreenshotView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderColor   = UIColor(white: 0.5, alpha: 0.5).cgColor
        //layer.cornerRadius  = 1
        contentMode         = .scaleAspectFill
        layer.borderWidth   = 0.2
        clipsToBounds       = true
    }
}
