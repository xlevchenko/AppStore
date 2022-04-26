//
//  DescriptionLabel.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/26/22.
//

import UIKit

class DescriptionLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        text = "configure"
    }
}
