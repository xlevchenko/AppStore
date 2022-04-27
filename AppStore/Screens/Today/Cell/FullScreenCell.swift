//
//  FullScreenCell.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/26/22.
//

import UIKit

class FullScreenCell: UITableViewCell {
    
    let descriptionLabel = DescriptionLabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        addSubview(descriptionLabel)
        descriptionLabel.fillSuperview(padding: .init(top: 0, left: 25, bottom: 0, right: 25))
        
        let attributedText = NSMutableAttributedString(string: "Angry Birds", attributes: [.foregroundColor : UIColor.black, .font : UIFont.systemFont(ofSize: 18, weight: .bold)])
        attributedText.append(NSAttributedString(string: " is a Finnish action-based media franchise created by Rovio Entertainment. The game series focuses on a flock of birds referred to by the same name who try to save their eggs from green-colored pigs. Inspired by the game Crush the Castle, the game has been praised for its successful combination of fun gameplay, comical style, and low price.\n\n\n", attributes: [.foregroundColor : UIColor.gray]))
        
        attributedText.append(NSAttributedString(string: "The Angry Birds Movie", attributes: [.foregroundColor : UIColor.black, .font : UIFont.systemFont(ofSize: 18, weight: .bold)]))
        attributedText.append(NSAttributedString(string: " and its sequel The Angry Birds Movie 2. By January 2014, there had been over 2 billion downloads across all platforms, including both regular and special editions.\n\n\n", attributes: [.foregroundColor : UIColor.gray]))
        
        attributedText.append(NSAttributedString(string: "By July 2015,", attributes: [.foregroundColor : UIColor.black, .font : UIFont.systemFont(ofSize: 18, weight: .bold)]))
        attributedText.append(NSAttributedString(string: " the series' games had been downloaded more than 3 billion times collectively, making it the most downloaded freemium game series of all time.\n\n\n", attributes: [.foregroundColor : UIColor.gray]))
        
        descriptionLabel.attributedText = attributedText
        descriptionLabel.numberOfLines = 0
    }
}
