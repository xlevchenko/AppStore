//
//  AppDetailController.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/8/22.
//

import UIKit

let detailID = "detailCell"

class AppDetailController: BaseListViewController, UICollectionViewDelegateFlowLayout {
    
    var appId: String! {
        didSet {
            let urlString = "https://itunes.apple.com/lookup?id=\(appId ?? "")"
            NetworkManager.shared.fetchGenericJSONData(urlString: urlString) { (result: SearchResult?, error) in
                print(result?.results.first?.releaseNotes)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: detailID)
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailID, for: indexPath) as! AppDetailCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
}
