//
//  SeachResultCell.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 3/23/22.
//

import UIKit

class SeachResultCell: UICollectionViewCell {
    
    static let reuseID  = "searchCell"
    
    let stackView = UIStackView()
    let avatarAppView   = AvatarImageView(frame: .zero)
    let nameLable       = AppTitleLable(textAlignment: .left, fontSize: 18)
    let categoryLable   = AppSecondaryLable(fontSize: 15)
    let ratingsLable    = AppSecondaryLable(fontSize: 14)
    let getButton       = GetButton(type: .system)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureStackView()
        set()
        //backgroundColor = .systemYellow
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set() {
        nameLable.text = "Instagram"
        categoryLable.text = "Photos & Video"
        ratingsLable.text = "9.13K"
    }
    
    
    private func configureStackView() {
        stackView.spacing       = 1
        stackView.axis          = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(nameLable)
        stackView.addArrangedSubview(categoryLable)
        stackView.addArrangedSubview(ratingsLable)
    }
    
    
    func configure() {
        addSubviews(avatarAppView, stackView, getButton)
  
        NSLayoutConstraint.activate([
            avatarAppView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            avatarAppView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            avatarAppView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -170),
            avatarAppView.widthAnchor.constraint(equalToConstant: 64),
            
            stackView.topAnchor.constraint(equalTo: avatarAppView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: avatarAppView.trailingAnchor, constant: 15),
            stackView.bottomAnchor.constraint(equalTo: avatarAppView.bottomAnchor),
            
            getButton.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            getButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            getButton.widthAnchor.constraint(equalToConstant: 70),
        ])
    }
}
