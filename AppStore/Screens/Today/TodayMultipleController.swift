//
//  TodayMultipleController.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 5/2/22.
//

import UIKit

let multipleID = "multipleCell"

class TodayMultipleController: BaseListViewController, UICollectionViewDelegateFlowLayout {

    var results = [FeedResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(MultipleAppCell.self, forCellWithReuseIdentifier: multipleID)
        collectionView.isScrollEnabled = false
        //fetchData()
    }
    
    
    func fetchData() {
        NetworkManager.shared.fetchTopPaid { appGroup, err in
            self.results = appGroup?.feed.results ?? []
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return min(4, results.count)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: multipleID, for: indexPath) as! MultipleAppCell
        cell.appResult = self.results[indexPath.item]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = (view.frame.height - 3 * spacing) / 4
        
        return .init(width: view.frame.width, height: height)
    }
    
    fileprivate let spacing: CGFloat = 16
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
}
