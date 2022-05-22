//
//  TodayController.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 3/22/22.
//

import UIKit

//let todayID = "todayCell"
//let multipleID = "multipleCell"

class TodayController: BaseListViewController, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate {
    
    var fullScreenController: FullScreenController!
    
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    let activityIndicatorView = ActivityIndicatorView(frame: .zero)
    
    var items = [TodayResult]()
    
    let blureVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        collectionView.backgroundColor = .systemGray6
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayResult.CellType.single.rawValue)
        collectionView.register(TodayMultipleAppCell.self, forCellWithReuseIdentifier: TodayResult.CellType.multiple.rawValue)
        configureActivityIndicator()
        fetchData()
        blureEffectView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.superview?.setNeedsLayout()
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
    
    
    fileprivate func showDailyListFullScreen(_ indexPath: IndexPath) {
        let fullController = TodayMultipleController(mode: .fullscreen)
        fullController.apps = self.items[indexPath.item].app
        let navigationController = BackEnabledNavigationController(rootViewController: fullController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch items[indexPath.item].cellType {
        case .multiple:
            showDailyListFullScreen(indexPath)
        case .single:
            showSingleAppFullScreen(indexPath: indexPath)
        }
    }
    
    
    fileprivate func setupSingleAppFullscreenController(_ indexPath: IndexPath) {
        let fullScreenController = FullScreenController()
        fullScreenController.todayItem = items[indexPath.row]
        fullScreenController.dismissHandler = {
            self.handleAppFullScreenDismissal()
        }
        fullScreenController.view.layer.cornerRadius = 16
        self.fullScreenController = fullScreenController
        
        // #1 Setup our pan getture
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(handleDrag))
        gesture.delegate = self
        fullScreenController.view.addGestureRecognizer(gesture)
        
        // #2 Add a blue effect view
         
        
        
        // #3 Not to interfere with  our UITableView scrolling
    }
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    var fullScreenBeginOffset: CGFloat = 0
    
    @objc fileprivate func handleDrag(gesture: UIPanGestureRecognizer) {
        if gesture.state == .began {
            fullScreenBeginOffset = fullScreenController.tableView.contentOffset.y
        }
        
        if fullScreenController.tableView.contentOffset.y > 0 {
            return
        }
        
        let translationY = gesture.translation(in: fullScreenController.view).y

        if gesture.state == .changed {
            if translationY > 0 {
                let trueOffset = translationY - fullScreenBeginOffset
                var scele = 1 - trueOffset / 1000
                
                scele = min(1, scele)
                scele = max(0.5, scele)
                
                let transform: CGAffineTransform = .init(scaleX: scele, y: scele)
                self.fullScreenController.view.transform = transform
            }
            
        } else if gesture.state == .ended {
            if translationY > 0 {
                handleAppFullScreenDismissal()
            }
        }
    }
    
    
    fileprivate func setupStartingCellFrame(_ indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        
        //absolute coordindates of cell
        guard let startiningFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        self.startingFrame = startiningFrame
    }
    
    
    fileprivate func setupAppFullscreenStartingPosition(_ indexPath: IndexPath) {
        let fullscreenView = fullScreenController.view!
        fullscreenView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleAppFullScreenDismissal)))
        
        view.addSubview(fullscreenView)
        addChild(fullScreenController)
        self.collectionView.isUserInteractionEnabled = false
        
        setupStartingCellFrame(indexPath)
        guard let startingFrame = self.startingFrame else { return }
        
        self.anchoredConstraints = fullscreenView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: startingFrame.origin.y, left: startingFrame.origin.x, bottom: 0, right: 0), size: .init(width: startingFrame.width, height: startingFrame.height))
        
        self.view.layoutIfNeeded()
    }
    
    
    var anchoredConstraints: AnchoredConstraints?
    
    fileprivate func beginAnimationAppFullscreen() {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            
            self.blureVisualEffectView.alpha = 1
            
            self.anchoredConstraints?.top?.constant = 0
            self.anchoredConstraints?.leading?.constant = 0
            self.anchoredConstraints?.width?.constant = self.view.frame.width
            self.anchoredConstraints?.height?.constant = self.view.frame.height
            
            self.view.layoutIfNeeded() // starting animation
            self.tabBarController?.tabBar.frame.origin.y += 100
            
            guard let cell = self.fullScreenController.tableView.cellForRow(at: [0, 0]) as? FullScreenHeaderCell else { return }
            cell.todayCell.topConstraint.constant = 48
            cell.layoutIfNeeded()
        }, completion: nil)
    }
    
    
    fileprivate func showSingleAppFullScreen(indexPath: IndexPath) {
        //#1 setup single fullcreen controller
        setupSingleAppFullscreenController(indexPath)
        
        //#2 setup fullcreen in its staring position
        setupAppFullscreenStartingPosition(indexPath)
        
        //#3 begin the fullscreen animation
        beginAnimationAppFullscreen()
    }
    
    
    var startingFrame: CGRect?
    
    @objc func handleAppFullScreenDismissal() {
        //access staringFrame
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            
            self.blureVisualEffectView.alpha = 0
            self.fullScreenController.view.transform = .identity
            
            guard let startiningFrame = self.startingFrame else { return }
            self.anchoredConstraints?.top?.constant = startiningFrame.origin.y
            self.anchoredConstraints?.leading?.constant = startiningFrame.origin.x
            self.anchoredConstraints?.width?.constant = startiningFrame.width
            self.anchoredConstraints?.height?.constant = startiningFrame.height
            self.view.layoutIfNeeded() // finish animation
            
            self.fullScreenController.tableView.contentOffset = .zero
            self.tabBarController?.tabBar.frame.origin.y -= 100
            
            guard let cell = self.fullScreenController.tableView.cellForRow(at: [0, 0]) as? FullScreenHeaderCell else { return }
            cell.closeButton.alpha = 0
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
        
        (cell as? TodayMultipleAppCell)?.multipleAppsController.collectionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleMultipleAppsTap)))
        return cell
    }
    
    
    @objc fileprivate func handleMultipleAppsTap(gesture: UIGestureRecognizer) {
        let collectionView = gesture.view
        
        //figure out which cell were clicking into
        var superview = collectionView?.superview
        
        while superview != nil {
            if let cell = superview as? TodayMultipleAppCell {
                guard let indexPath = self.collectionView.indexPath(for: cell) else { return }
                
                let apps = self.items[indexPath.item].app
                let fullController = TodayMultipleController(mode: .fullscreen)
                fullController.apps = apps
                let navigationController = BackEnabledNavigationController(rootViewController: fullController)
                navigationController.modalPresentationStyle = .fullScreen
                present(navigationController, animated: true)
            }
            superview = superview?.superview
        }
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
    
    
    func blureEffectView() {
        view.addSubview(blureVisualEffectView)
        blureVisualEffectView.fillSuperview()
        blureVisualEffectView.alpha = 0
    }
}
