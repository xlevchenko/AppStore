//
//  SearchVC.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 3/22/22.
//

import UIKit

class SearchVC: BaseListViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate var appResults          = [Result]()
    fileprivate let searchComtroller    = UISearchController(searchResultsController: nil)
    fileprivate let searchLable         = AppTitleLable(text: "Please enter search term above..", textAlignment: .center, fontSize: 20)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(SeachResultCell.self, forCellWithReuseIdentifier: SeachResultCell.reuseID)
        setupSearchBar()
        collectionView.addSubview(searchLable)
        searchLable.fillSuperview(padding: .init(top: 100, left: 40, bottom: 0, right: 50))
        
    }
    
    
    fileprivate func setupSearchBar() {
        definesPresentationContext                  = true
        navigationItem.searchController             = searchComtroller
        navigationItem.hidesSearchBarWhenScrolling  = false
        searchComtroller.searchBar.delegate         = self
    }
    
    
    var timer = Timer()
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            
            NetworkManager.shared.fetchITunesApps(searchTerm: searchText) { res, error in
                self.appResults = res?.results ?? []
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
    }
    
    
    fileprivate func fetchITunesApps() {
        NetworkManager.shared.fetchITunesApps(searchTerm: "") { res, error in
            self.appResults = res?.results ?? []
            
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
        return CGSize(width: view.frame.width, height: 330)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        searchLable.isHidden = appResults.count != 0
        return appResults.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeachResultCell.reuseID, for: indexPath) as! SeachResultCell
        cell.appResult = appResults[indexPath.item]        
        return cell
    }   
}

