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
    
    let closeButtom = CloseButton(type: .system)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if mode == .fullscreen {
            configureButtom()            
        } else {
            collectionView.isScrollEnabled = false
        }
        
        collectionView.register(MultipleAppCell.self, forCellWithReuseIdentifier: multipleID)
    }
    
    
    override var prefersStatusBarHidden: Bool { return true }
    
    func fetchData() {
        NetworkManager.shared.fetchTopPaid { appGroup, err in
            self.results = appGroup?.feed.results ?? []
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    
    func configureButtom() {
        closeButtom.addTarget(self, action: #selector(handleDissmis), for: .touchUpInside)

        view.addSubview(closeButtom)
        closeButtom.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 24, left: 0, bottom: 0, right: 12), size: .init(width: 80, height: 38))
    }
    
    
    @objc func handleDissmis() {
        closeButtom.isHidden = true
        dismiss(animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if mode == .fullscreen {
            return .init(top: 12, left: 24, bottom: 12, right: 24)
        }
        return .zero
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if mode == .fullscreen {
            return results.count
        }
        
        return min(4, results.count)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: multipleID, for: indexPath) as! MultipleAppCell
        cell.appResult = self.results[indexPath.item]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 76
        
        if mode == .fullscreen {
            return .init(width: view.frame.width - 48, height: height)
        }
        return .init(width: view.frame.width, height: height)
    }
    
    
    fileprivate let spacing: CGFloat = 16
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    
    fileprivate let mode: Mode
    
    enum Mode {
        case small, fullscreen
    }
    
    init(mode: Mode) {
        self.mode = mode
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
