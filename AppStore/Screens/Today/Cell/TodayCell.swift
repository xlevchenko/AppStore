//
//  TodayCell.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/25/22.
//

import UIKit

class TodayCell: UICollectionViewCell {
    
    let imageView = UIImageView(image: UIImage(named: "saul"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 16
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        addSubview(imageView)
        imageView.contentMode = .scaleToFill
        imageView.centerInSuperview(size: .init(width: 250, height: 250))
    }
}
