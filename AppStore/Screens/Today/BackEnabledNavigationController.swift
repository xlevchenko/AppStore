//
//  BackEnabledNavigationController.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 5/7/22.
//

import UIKit

class BackEnabledNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.viewControllers.count > 1
    }
}
