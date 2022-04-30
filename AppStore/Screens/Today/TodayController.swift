//
//  TodayController.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 3/22/22.
//

import UIKit

let todayID = "TodayCell"

class TodayController: BaseListViewController, UICollectionViewDelegateFlowLayout {
    
    var fullScreenController: FullScreenController!
    
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    var items = [TodayResult(categoty: "Game", title: "Angry Birds", image: UIImage(named: "angri")!, description: "Angry Birds is a 2009 casual puzzle video game developed by Rovio Entertainment.", backgroundColor: .white), TodayResult(categoty: "Holidays", title: "Travel on a Budget", image: UIImage(named: "travel")!, description: "Find out all you need to need to know on how to travel without packing everything!", backgroundColor: .systemYellow)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        collectionView.backgroundColor = .systemGray6
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: todayID)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let fullScreenController = FullScreenController()
        fullScreenController.todayItem = items[indexPath.row]
        fullScreenController.dismissHandler = {
            self.handleRemoveView()
        }
        
        let fullscreenView = fullScreenController.view!
        fullscreenView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRemoveView)))
        
        view.addSubview(fullscreenView)
        addChild(fullScreenController)
        self.fullScreenController = fullScreenController
        
        self.collectionView.isUserInteractionEnabled = false
        
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        
        //absolute coordindates of cell
        guard let startiningFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        self.startiningFrame = startiningFrame
        
        fullscreenView.translatesAutoresizingMaskIntoConstraints = false
        topConstraint = fullscreenView.topAnchor.constraint(equalTo: view.topAnchor, constant: startiningFrame.origin.y)
        leadingConstraint = fullscreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startiningFrame.origin.x)
        widthConstraint = fullscreenView.widthAnchor.constraint(equalToConstant: startiningFrame.width)
        heightConstraint = fullscreenView.heightAnchor.constraint(equalToConstant: startiningFrame.height)
        [topConstraint, leadingConstraint, widthConstraint, heightConstraint].forEach ({ $0?.isActive = true })
        
        self.view.layoutIfNeeded()
        fullscreenView.layer.cornerRadius = 16
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
           
            self.topConstraint?.constant = 0
            self.leadingConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            
            self.view.layoutIfNeeded() // starting animation
            self.tabBarController?.tabBar.frame.origin.y += 100
            
            guard let cell = self.fullScreenController.tableView.cellForRow(at: [0, 0]) as? FullScreenHeaderCell else { return }
            cell.todayCell.topConstraint.constant = 48
            cell.layoutIfNeeded()
        }, completion: nil)
    }
    
    
    var startiningFrame: CGRect?
    
    
    @objc func handleRemoveView() {
        //access staringFrame
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {

            guard let startiningFrame = self.startiningFrame else { return }
            self.topConstraint?.constant = startiningFrame.origin.y
            self.leadingConstraint?.constant = startiningFrame.origin.x
            self.widthConstraint?.constant = startiningFrame.width
            self.heightConstraint?.constant = startiningFrame.height
            self.view.layoutIfNeeded() // finish animation
            
            self.fullScreenController.tableView.contentOffset = .zero
            self.tabBarController?.tabBar.frame.origin.y -= 100
        
            guard let cell = self.fullScreenController.tableView.cellForRow(at: [0, 0]) as? FullScreenHeaderCell else { return }
            cell.todayCell.topConstraint.constant = 24
            cell.layoutIfNeeded()
            
        }, completion: { _ in
            self.fullScreenController.view.removeFromSuperview()
            self.fullScreenController.removeFromParent()
            self.collectionView.isUserInteractionEnabled = true
            
        })
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: todayID, for: indexPath) as! TodayCell
        cell.todayItem = items[indexPath.item]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: 450)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
}
