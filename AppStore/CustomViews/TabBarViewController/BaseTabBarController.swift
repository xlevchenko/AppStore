//
//  BaseTabBarController.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 3/21/22.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().backgroundColor = .secondarySystemBackground
        viewControllers = [createTodayNC(), createAppsNC(), createSearchVC()]
    }
    
    func createTodayNC() -> UINavigationController {
        let todayVC                 = TodayVC()
        todayVC.tabBarItem.image    = UIImage(systemName: "doc.text.image")
        todayVC.title               = "Today"
        
        return UINavigationController(rootViewController: todayVC)
    }
    
    func createAppsNC() -> UINavigationController {
        let appsVC                  = AppsVC()
        appsVC.tabBarItem.image     = UIImage(systemName: "square.stack.3d.up.fill")
        appsVC.title                = "Apps"
        
        return UINavigationController(rootViewController: appsVC)
    }
    
    func createSearchVC() -> UINavigationController {
        let searchVC                = SearchVC()
        searchVC.tabBarItem.image   = UIImage(systemName: "magnifyingglass")
        searchVC.title              = "Search"
        
        return UINavigationController(rootViewController: searchVC)
    }
}

