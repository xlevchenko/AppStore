//
//  PreviewCell.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/11/22.
//

import UIKit

class PreviewCell: UICollectionViewCell {
    
    
    let horizontalController = PreviewScreenshotsController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        addSubview(horizontalController.view)
        horizontalController.view.fillSuperview()
    }
    
}
