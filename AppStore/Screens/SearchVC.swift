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
    

    fileprivate func fetchITunesApps() {
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else { return }
        
        //fetch data from internet
        URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            
            if let error = error {
                print("Failed to featch apps", error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                print(searchResult)
            } catch {
                print("Failed to decode json:", error)
            }
        }
        .resume()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeachResultCell.reuseID, for: indexPath) as! SeachResultCell
        cell.nameLable.text = "Instagram"
        cell.categoryLable.text = "Photos & Video"
        cell.ratingsLable.text = "9.13K"
        return cell
    }
}

