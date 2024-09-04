//
//  MainCoordinator.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//

import Foundation
import UIKit

protocol MainCoordinatorFlowDelegate: AnyObject {
    func goToHomeScreen()
}

protocol MainCoordinatorProtocol {
    func goToHome()
}

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = MainViewController(viewModel: MainViewModel(delegate: self))
        navigationController.pushViewController(viewController, animated: false)
    }
    

}

extension MainCoordinator: MainCoordinatorProtocol {
    private func getHomeViewController() -> HomeViewController {
        return HomeViewController()
    }
    
    func goToHome() {
        let viewController = self.getHomeViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
}

extension MainCoordinator: MainCoordinatorFlowDelegate {
    func goToHomeScreen() {
        self.goToHome()
    }
}
