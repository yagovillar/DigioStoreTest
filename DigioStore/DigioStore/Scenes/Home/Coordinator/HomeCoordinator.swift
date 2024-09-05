//
//  HomeCoordinator.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewModel = HomeViewModel(networkManager: NetworkManager())
        let viewController = HomeViewController(viewModel: viewModel)
        viewModel.delegate = viewController
        navigationController.pushWithoutBackButton(viewController, animated: true)
    }

}
