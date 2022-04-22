//
//  AppDetailController.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/8/22.
//

import UIKit

let detailID    = "detailCell"
let previewID   = "previewCell"
let reviewID    = "reviewCell"

class AppDetailController: BaseListViewController, UICollectionViewDelegateFlowLayout {
    
    var appId: String! {
        didSet {
            let urlString = "https://itunes.apple.com/lookup?id=\(appId ?? "")"
            NetworkManager.shared.fetchGenericJSONData(urlString: urlString) { (result: SearchResult?, error) in
                
                let app = result?.results.first
                self.app = app
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
            let reviewUrl = "https://itunes.apple.com/rss/customerreviews/id=\(appId ?? "")/json"
            NetworkManager.shared.fetchGenericJSONData(urlString: reviewUrl) { (reviews: Review?, error) in
                
                if let error = error {
                    print("Failed to featch apps", error)
                    return
                }
                
                reviews?.feed.entry.forEach({ star in
                    print(star.rating)
                })
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    
    var app: Result?
    var reviews: Review?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: detailID)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: previewID)
        collectionView.register(ReviewRowCell.self, forCellWithReuseIdentifier: reviewID)
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailID, for: indexPath) as! AppDetailCell
            cell.app = app
            return cell
        } else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: previewID, for: indexPath) as! PreviewCell
            cell.horizontalController.app = self.app
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewID, for: indexPath) as! ReviewRowCell
            cell.reviewController.reviews = self.reviews
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var height: CGFloat = 200
        
        if indexPath.item == 0 {
            let dummyCell = AppDetailCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
            dummyCell.app = app
            dummyCell.layoutIfNeeded()
            
            let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            height = estimatedSize.height
        } else if indexPath.item == 1 {
            height = 650
        } else {
            height = 250
        }
        
        return .init(width: view.frame.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 16, right: 0)
    }
}
