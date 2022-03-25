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
        backgroundColor = .systemBlue
        widthAnchor.constraint(equalToConstant: 110).isActive = true
        heightAnchor.constraint(equalToConstant: 210).isActive = true
    }
}
