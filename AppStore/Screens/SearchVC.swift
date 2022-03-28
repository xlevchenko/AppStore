//
//  SearchVC.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 3/22/22.
//

import UIKit

class SearchVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(SeachResultCell.self, forCellWithReuseIdentifier: SeachResultCell.reuseID)
        fetchITunesApps()
    }
    
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate var appResults = [Result]()
    
    
    fileprivate func fetchITunesApps() {
        NetworkManager.shared.fetchITunesApps { results, error in
            self.appResults = results
            
            if let error = error {
                print("Failed to featch apps", error)
                return
            }
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeachResultCell.reuseID, for: indexPath) as! SeachResultCell
        let appResult = appResults[indexPath.item]
        cell.nameLable.text = appResult.trackName
        cell.categoryLable.text = appResult.primaryGenreName
        cell.ratingsLable.text = String("\(appResult.averageUserRating)")
        return cell
    }
}

