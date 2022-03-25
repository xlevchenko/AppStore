//
//  AvatarImageView.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 3/23/22.
//

import UIKit

class AvatarImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor     = .red
        layer.cornerRadius  = 12
        
        translatesAutoresizingMaskIntoConstraints               = false
        widthAnchor.constraint(equalToConstant: 64).isActive    = true
        heightAnchor.constraint(equalToConstant: 64).isActive   = true
    }
}
