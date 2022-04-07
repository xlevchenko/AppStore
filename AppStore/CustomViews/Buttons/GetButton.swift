//
//  GetButton.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 3/23/22.
//

import UIKit

class GetButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() {
        titleLabel?.font    = .boldSystemFont(ofSize: 16)
        backgroundColor     = UIColor(white: 0.95, alpha: 1)
        layer.cornerRadius  = 16
        
        setTitle("GET", for: .normal)
        setTitleColor(.systemBlue, for: .normal)
        
        translatesAutoresizingMaskIntoConstraints               = false
        widthAnchor.constraint(equalToConstant: 80).isActive    = true
        heightAnchor.constraint(equalToConstant: 32).isActive   = true
    }
}
