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
        viewControllers = [
            createVC(viewController: AppsPageController(), title: "Apps", image: SFSymbols.apps),
            createVC(viewController: SearchController(), title: "Search", image: SFSymbols.search),
            createVC(viewController: TodayVC(), title: "Today", image: SFSymbols.today)
        ]
    }
   
    
    fileprivate func createVC(viewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles  = true
        navController.tabBarItem.image                  = image
        navController.tabBarItem.title                  = title
        viewController.navigationItem.title             = title
        viewController.view.backgroundColor             = .systemBackground
        
        return navController
    }
}

