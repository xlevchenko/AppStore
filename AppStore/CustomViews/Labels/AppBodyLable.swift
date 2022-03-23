//
//  AppBodyLable.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 3/23/22.
//

import UIKit

class AppBodyLable: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        text = "APP NAME"
    }
}
