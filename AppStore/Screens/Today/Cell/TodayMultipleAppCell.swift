//
//  TodayMultipleAppCell.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 5/1/22.
//

import UIKit

class TodayMultipleAppCell: BaseTodayCell {
    
    override var todayItem: TodayResult! {
        didSet {
            categoryLabel.text = todayItem.categoty
            titleLabel.text = todayItem.title
            multipleAppsController.apps = todayItem.app
            multipleAppsController.collectionView.reloadData()
        }
    }
    
    let categoryLabel = TitleLable(text: "", textAlignment: .left, fontSize: 22 )
    let titleLabel = TitleLable(text: "", textAlignment: .left, fontSize: 28)

    let multipleAppsController = TodayMultipleController(mode: .small)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 16
        titleLabel.numberOfLines = 2
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        let stackView = VerticalStackView(
            arrangedSubviews: [
                categoryLabel,
                titleLabel,
                multipleAppsController.view
            ], spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
    }
}
