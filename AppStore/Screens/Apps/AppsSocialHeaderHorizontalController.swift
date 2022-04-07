//
//  AppsHeaderHorizontalController.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/3/22.
//

import UIKit

private let appsHeaderID = "socialHeaderCell"

class AppsSocialHeaderHorizontalController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    var socialApps  = [SocialResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(AppsSocialHeaderCell.self, forCellWithReuseIdentifier: appsHeaderID)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 35, height: view.frame.height)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialApps.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appsHeaderID, for: indexPath) as! AppsSocialHeaderCell
        let apps = self.socialApps[indexPath.item]
        cell.companyLable.text = apps.name
        cell.titleLable.text = apps.tagline
        cell.imageView.sd_setImage(with: URL(string: apps.imageUrl))
        return cell
    }
}
