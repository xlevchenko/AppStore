//
//  AppsPageHeaderVC.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/3/22.
//

import UIKit

class AppsPageHeaderVC: UICollectionReusableView {
        
    let appHeaderHorizontalController = AppsHeaderHorizontalVC()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(appHeaderHorizontalController.view)
        appHeaderHorizontalController.view.fillSuperview()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
