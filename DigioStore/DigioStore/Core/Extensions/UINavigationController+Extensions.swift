//
//  UINavigationController+Extensions.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//

import Foundation
import UIKit

extension UINavigationController {
    func pushWithoutBackButton(_ viewController: UIViewController, animated: Bool) {
        // Hide the back button by setting hidesBackButton to true
        viewController.navigationItem.hidesBackButton = true
        
        // Push the view controller as usual
        self.pushViewController(viewController, animated: animated)
    }
    
    func pushWithoutBackTitle(_ viewController: UIViewController, animated: Bool) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.topViewController?.navigationItem.backBarButtonItem = backItem

        self.pushViewController(viewController, animated: animated)
    }
}
