//
//  SeachResultCell.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 3/23/22.
//

import UIKit

class SeachResultCell: UICollectionViewCell {
    
    static let reuseID  = "searchCell"
    
    let avatarAppView   = AvatarImageView(frame: .zero)
    let nameLable       = AppTitleLable(textAlignment: .left, fontSize: 14)
    let categoryLable   = AppBodyLable(textAlignment: .left)
    let ratingsLable    = AppSecondaryLable(fontSize: 12)
    let getButton       = GetButton(type: .system)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        backgroundColor = .systemYellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        let stackView = UIStackView(arrangedSubviews: [avatarAppView, nameLable, getButton])
        stackView.spacing = 12
        
        addSubviews(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
