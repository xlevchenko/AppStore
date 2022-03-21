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
        tabBar.backgroundColor = .systemBackground
        
        let redViewController = UIViewController()
        redViewController.view.backgroundColor = .systemRed
        
        
        let yellowViewController = UIViewController()
        yellowViewController.view.backgroundColor = .systemYellow
        
        viewControllers = [redViewController, yellowViewController]
    }
}
