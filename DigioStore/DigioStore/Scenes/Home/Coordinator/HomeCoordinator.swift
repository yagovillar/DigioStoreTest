//
//  HomeCoordinator.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//

import Foundation
import UIKit

protocol HomeCoordinatorFlow {
    func goToDetails(productName: String)
}

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        setupNavigationBarAppearance() // Configura a aparência da navigation bar
    }

    func start() {
        let viewModel = HomeViewModel(networkManager: NetworkManager())
        let viewController = HomeViewController(viewModel: viewModel)
        viewModel.delegate = viewController
        viewModel.coordinatorDelegate = self
        navigationController.pushWithoutBackButton(viewController, animated: true)
    }

    private func setupNavigationBarAppearance() {
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.barTintColor = .white
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
}

extension HomeCoordinator: HomeCoordinatorFlow {
    func goToDetails(productName: String) {
        let viewModel = DetailsViewModel(networkManager: NetworkManager(), productName: productName)
        let viewController = DetailsViewController(viewModel: viewModel)
        navigationController.pushWithoutBackTitle(viewController, animated: true)
    }
}
