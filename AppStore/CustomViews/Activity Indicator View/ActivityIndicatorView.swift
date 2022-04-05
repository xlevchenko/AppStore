//
//  ActivityIndicatorView.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/5/22.
//

import UIKit

class ActivityIndicatorView: UIActivityIndicatorView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        style = .large
        color = .black
        startAnimating()
        hidesWhenStopped = true
    }
}
