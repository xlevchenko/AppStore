//
//  AppsVC.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 3/22/22.
//

import UIKit

class AppsPageVC: BaseListViewController, UICollectionViewDelegateFlowLayout {

    let headerID = "headerID"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(AppsCell.self, forCellWithReuseIdentifier: AppsCell.appReuseID)
        collectionView.register(AppsPageHeaderVC.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        fetchData()
    }

    
    var editorsChoiceGames: AppsResult?
    
    fileprivate func fetchData() {
        NetworkManager.shared.fetchApps { appsResult, error in
            
            if let error = error {
                print("Failed to featch apps", error)
            }
            self.editorsChoiceGames = appsResult
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath)
        return header
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsCell.appReuseID, for: indexPath) as! AppsCell
        cell.titleLabel.text = editorsChoiceGames?.feed.title
        cell.horizontalController.appResult = editorsChoiceGames
        cell.horizontalController.collectionView.reloadData()
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
}
