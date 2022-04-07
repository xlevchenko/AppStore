//
//  AppsHeaderHorizontalVC.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/3/22.
//

import UIKit

class AppsHeaderHorizontalVC: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    let cellID      = "cellID"
    var socialApps  = [SocialApps]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(AppsHeaderAppCell.self, forCellWithReuseIdentifier: cellID)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 35, height: view.frame.height)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialApps.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppsHeaderAppCell
        let apps = self.socialApps[indexPath.item]
        cell.companyLable.text = apps.name
        cell.titleLable.text = apps.tagline
        cell.imageView.sd_setImage(with: URL(string: apps.imageUrl))
        return cell
    }
}
