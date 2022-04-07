//
//  AppRowCell.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/2/22.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    
    let imageView       = IconImageView(frame: .zero)
    let nameLable       = TitleLable(text: "Name App", textAlignment: .left, fontSize: 20)
    let companyLable    = SecondaryTitleLable(text: "Company name", fontSize: 16)
    let getButton       = GetButton(type: .system)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() {
        let stackView = UIStackView(arrangedSubviews: [imageView, VerticalStackView.init(arrangedSubviews: [nameLable, companyLable], spacing: 4), getButton])
        imageView.backgroundColor   = .yellow
        stackView.spacing           = 16
        stackView.alignment         = .center
        
        addSubview(stackView)
        stackView.fillSuperview()
    }
}
