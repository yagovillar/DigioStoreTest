//
//  HomeViewModel.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func viewModel(_ viewModel: HomeViewModelProtocol, didFetchProducts products: DigioStore)
    func viewModel(_ viewModel: HomeViewModelProtocol, didFailWithError error: AppError)
}

protocol HomeViewModelProtocol {
    func getProducts()
    func goToDetail(productName: String)
    var products: DigioStore? { get }
    var delegate: HomeViewModelDelegate? { get set }
}

class HomeViewModel: HomeViewModelProtocol {
    
    private let networkManager: NetworkManagerProtocol
    weak var delegate: HomeViewModelDelegate?
    var coordinatorDelegate: HomeCoordinatorFlow?
    private(set) var products: DigioStore? // Propriedade somente leitura
    
    // MARK: - Initializer
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    // MARK: - Public Methods
    func getProducts() {
        networkManager.fetchDigioStoreData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let digioStore):
                self.products = digioStore
                self.delegate?.viewModel(self, didFetchProducts: digioStore)
            case .failure(let error):
                self.delegate?.viewModel(self, didFailWithError: error)
            }
        }
    }
    
    func goToDetail(productName: String) {
        self.coordinatorDelegate?.goToDetails(productName: productName)
    }
}
