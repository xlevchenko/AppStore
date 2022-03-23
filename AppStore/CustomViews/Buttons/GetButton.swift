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
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.font = .boldSystemFont(ofSize: 14)
        setTitle("GET", for: .normal)
        setTitleColor(.systemBlue, for: .normal)
        backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
}
