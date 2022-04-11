//
//  PreviewScreenshotsController.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/11/22.
//

import UIKit

let screenshotID = "ScreenshotCell"

class PreviewScreenshotsController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(ScreenshotsCell.self, forCellWithReuseIdentifier: screenshotID)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: screenshotID, for: indexPath) as! ScreenshotsCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 250, height: view.frame.height)
    }
}
