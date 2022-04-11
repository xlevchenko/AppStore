//
//  PreviewCell.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/11/22.
//

import UIKit

class PreviewCell: UICollectionViewCell {
    
    let previewLable = TitleLable(text: "Preview", textAlignment: .left, fontSize: 20)
    let horizontalController = PreviewScreenshotsController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        addSubview(previewLable)
        previewLable.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,
                            padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        addSubview(horizontalController.view)
        horizontalController.view.anchor(top: previewLable.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
    }
    
}
