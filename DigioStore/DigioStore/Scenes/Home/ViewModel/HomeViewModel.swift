//
//  HomeViewModel.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func didGetProducts()
    func didFail(error: String)
}

protocol HomeViewModelProtocol {
    func getProducts()
    var products: DigioStore? { get }
}

class HomeViewModel: HomeViewModelProtocol {
    
    private let networkManager: NetworkManager
    weak var delegate: HomeViewModelDelegate?
    private(set) var products: DigioStore? // Propriedade somente leitura
    
    // MARK: - Initializer
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    // MARK: - Public Methods
    func getProducts() {
        networkManager.fetchDigioStoreData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let digioStore):
                self.products = digioStore
                self.delegate?.didGetProducts()
            case .failure(let error):
                self.delegate?.didFail(error: "Falha ao carregar os produtos: \(error.localizedDescription)")
            }
        }
    }
}
