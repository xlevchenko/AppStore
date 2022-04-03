//
//  AppsHeaderHorizontalVC.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/3/22.
//

import UIKit

class AppsHeaderHorizontalVC: BaseListViewController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(AppsHeaderAppCell.self, forCellWithReuseIdentifier: cellID)
        configure()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 35, height: view.frame.height)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        return cell
    }
    
    
    func configure() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
}
