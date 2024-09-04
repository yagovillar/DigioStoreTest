//
//  MainCoordinator.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
  
  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let viewController = ViewController()
    navigationController.pushViewController(viewController, animated: false)
  }

}
