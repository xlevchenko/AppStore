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
        let todayVC                     = TodayVC()
        todayVC.tabBarItem              = UITabBarItem(title: "Today", image: SFSymbols.today, tag: 0)
        todayVC.navigationItem.title    = "Today"
        return UINavigationController(rootViewController: todayVC)
    }
    
    func createAppsNC() -> UINavigationController {
        let appsVC                      = AppsVC()
        appsVC.tabBarItem               = UITabBarItem(title: "Apps", image: SFSymbols.apps, tag: 1)
        appsVC.navigationItem.title     = "Apps"
        return UINavigationController(rootViewController: appsVC)
    }
    
    func createSearchVC() -> UINavigationController {
        let searchVC                    = SearchVC()
        searchVC.tabBarItem             = UITabBarItem(title: "Search", image: SFSymbols.search, tag: 2)
        searchVC.navigationItem.title   = "Search"
        return UINavigationController(rootViewController: searchVC)
    }
}

