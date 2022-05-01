//
//  CloseButton.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/27/22.
//

import UIKit

class CloseButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        tintColor = .systemGray
    }
}
