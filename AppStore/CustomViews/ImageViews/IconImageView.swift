//
//  IconImageView.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 3/26/22.
//

import UIKit
import SDWebImage

class IconImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius  = 18
        clipsToBounds       = true
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
