//
//  MultipleAppCell.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 5/2/22.
//

import UIKit

class MultipleAppCell: UICollectionViewCell {
    
    var appResult: FeedResult! {
        didSet {
            nameLable.text = appResult.name
            companyLable.text = appResult.artistName
            imageView.sd_setImage(with: URL(string: appResult.artworkUrl100))
             
        }
    }
    
    let imageView       = IconImageView(frame: .zero)
    let nameLable       = TitleLable(text: "Name App", textAlignment: .left, fontSize: 20)
    let companyLable    = SecondaryTitleLable(text: "Company name", fontSize: 16)
    let getButton       = GetButton(type: .system)
    
    let separartorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.3, alpha: 0.3)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
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
        
        addSubview(separartorView)
        separartorView.anchor(top: nil, leading: nameLable.leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: -8, right: 0), size: .init(width: 0, height: 0.5))
    }
}
