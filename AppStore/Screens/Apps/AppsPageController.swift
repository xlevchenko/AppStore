//
//  AppsPageController.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 3/22/22.
//

import UIKit

private let socialHeaderID    = "socialHeaderCell"
private let appID             = "appCell"

class AppsPageController: BaseListViewController, UICollectionViewDelegateFlowLayout {
    
    let activityIndicatorView = ActivityIndicatorView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(AppsSocialPageHeaderController.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: socialHeaderID)
        collectionView.register(AppsCell.self, forCellWithReuseIdentifier: appID)
        
        fetchData()
        configureActivityIndicator()
    }

    var socialApps = [SocialResult]()
    var groupsResult = [AppsResult]()
    
    
    fileprivate func fetchData() {
        
        var group1: AppsResult?
        var group2: AppsResult?
        
        //help you sync your data fetches together
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        NetworkManager.shared.fetchSocialApps { app, error in
            
            dispatchGroup.leave()
            if let error = error {
                print("Failed to featch apps", error)
            }
            self.socialApps = app ?? []
        }
        
        dispatchGroup.enter()
        NetworkManager.shared.fetchTopFree { appsResult, error in
            
            dispatchGroup.leave()
            if let error = error {
                print("Failed to featch apps", error)
            }
            group1 = appsResult
        }
        
        dispatchGroup.enter()
        NetworkManager.shared.fetchTopPaid { appsResult, error in
            
            dispatchGroup.leave()
            if let error = error {
                print("Failed to featch apps", error)
            }
            group2 = appsResult
        }
        
        //completion
        dispatchGroup.notify(queue: .main) {
            self.activityIndicatorView.stopAnimating()
            
            if let group = group1 {
                self.groupsResult.append(group)
            }
            
            if let group = group2 {
                self.groupsResult.append(group)
            }
            
            self.collectionView.reloadData()
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: socialHeaderID, for: indexPath) as! AppsSocialPageHeaderController
        header.appHeaderHorizontalController.socialApps = self.socialApps
        header.appHeaderHorizontalController.collectionView.reloadData()
        return header
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groupsResult.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appID, for: indexPath) as! AppsCell
        let appsGroups = groupsResult[indexPath.item]
        cell.titleLabel.text = appsGroups.feed.title
        cell.horizontalController.appResult = appsGroups
        cell.horizontalController.collectionView.reloadData()
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
    
    func configureActivityIndicator() {
        view.addSubview(activityIndicatorView)
        activityIndicatorView.fillSuperview()
    }
}
