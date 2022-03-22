//
//  TodayVC.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 3/22/22.
//

import UIKit

class TodayVC: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    init() {
        super.init(collectionViewLayout: UICollectionViewLayout())
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
