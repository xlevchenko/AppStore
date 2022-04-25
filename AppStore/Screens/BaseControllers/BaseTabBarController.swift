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
            createVC(viewController: TodayController(), title: "Today", image: SFSymbols.today),
            createVC(viewController: AppsPageController(), title: "Apps", image: SFSymbols.apps),
            createVC(viewController: SearchController(), title: "Search", image: SFSymbols.search)
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

