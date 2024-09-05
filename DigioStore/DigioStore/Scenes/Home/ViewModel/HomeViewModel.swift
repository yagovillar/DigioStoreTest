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
    var products: DigioStore? { get } // Propriedade somente leitura
}

class HomeViewModel: HomeViewModelProtocol {
    
    var networkManager: NetworkManager
    var delegate: HomeViewModelDelegate?
    var products: DigioStore? // Acesso somente leitura
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getProducts() {
        networkManager.fetchDigioStoreData { result in
            switch result {
            case .success(let success):
                self.products = success
                self.delegate?.didGetProducts()
            case .failure(let failure):
                self.delegate?.didFail(error: "Falha ao carregar os produtos")
            }
        }
    }
}
