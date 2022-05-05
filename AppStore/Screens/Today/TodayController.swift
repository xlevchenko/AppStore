//
//  TodayController.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 3/22/22.
//

import UIKit

//let todayID = "todayCell"
//let multipleID = "multipleCell"

class TodayController: BaseListViewController, UICollectionViewDelegateFlowLayout {
    
    var fullScreenController: FullScreenController!
    
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    let activityIndicatorView = ActivityIndicatorView(frame: .zero)

    var items = [TodayResult]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        collectionView.backgroundColor = .systemGray6
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayResult.CellType.single.rawValue)
        collectionView.register(TodayMultipleAppCell.self, forCellWithReuseIdentifier: TodayResult.CellType.multiple.rawValue)
        configureActivityIndicator()
        fetchData()
    }
    
    
    func fetchData() {
        let dispatchGroup = DispatchGroup()
        
        var appTopFreeResult: AppsResult?
        var appTopPaidResult: AppsResult?
        
        dispatchGroup.enter()
        NetworkManager.shared.fetchTopFree { appResult, error in
            //make shure you check you error
            appTopFreeResult = appResult
            dispatchGroup.leave()
            
        }
        dispatchGroup.enter()
        NetworkManager.shared.fetchTopPaid { appResult, error in
            appTopPaidResult = appResult
            dispatchGroup.leave()
        }
        
        
        //completion block
        dispatchGroup.notify(queue: .main) {
            //I'll have access to top grossing and games somehow
            self.activityIndicatorView.stopAnimating()
            
            self.items = [
                TodayResult(categoty: "THE DAILY LIST", title: appTopFreeResult?.feed.title ?? "", image: UIImage(named: "angri")!, description: "", backgroundColor: .white, cellType: .multiple, app: appTopFreeResult?.feed.results ?? []),
                
                TodayResult(categoty: "Game", title: "Angry Birds", image: UIImage(named: "angri")!, description: "Angry Birds is a 2009 casual puzzle video game developed by Rovio Entertainment.", backgroundColor: .white, cellType: .single, app: []),
                
                TodayResult(categoty: "THE DAILY LIST", title: appTopPaidResult?.feed.title ?? "", image: UIImage(named: "angri")!, description: "", backgroundColor: .white, cellType: .multiple, app: appTopPaidResult?.feed.results ?? []),
                
                TodayResult(categoty: "Holidays", title: "Travel on a Budget", image: UIImage(named: "travel")!, description: "Find out all you need to need to know on how to travel without packing everything!", backgroundColor: .systemYellow, cellType: .single, app: [])
            ]
            
            self.collectionView.reloadData()
        }
    }

    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if items[indexPath.item].cellType == .multiple {
            let fullController = TodayMultipleController(mode: .fullscreen)
            fullController.results = self.items[indexPath.item].app
            fullController.modalPresentationStyle = .fullScreen
            present(fullController, animated: true)
            return
        }
        
        
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
        
        let cellId = items[indexPath.item].cellType.rawValue
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BaseTodayCell
        cell.todayItem = items[indexPath.item]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: 500)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
    
    func configureActivityIndicator() {
        view.addSubview(activityIndicatorView)
        activityIndicatorView.fillSuperview()
    }
}
