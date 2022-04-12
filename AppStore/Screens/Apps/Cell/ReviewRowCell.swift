//
//  ReviewRowCell.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/12/22.
//

import UIKit

class ReviewRowCell: UICollectionViewCell {
    
    let reviewController = ReviewsController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() {
        addSubview(reviewController.view)
        reviewController.view.fillSuperview()
    }
}
