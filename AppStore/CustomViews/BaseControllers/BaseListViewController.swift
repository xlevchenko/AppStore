//
//  BaseListViewController.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 3/31/22.
//

import UIKit

class BaseListViewController: UICollectionViewController {

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
