//
//  DetailsViewModel.swift
//  DigioStore
//
//  Created by Yago Vanzan on 05/09/24.
//

import Foundation

protocol DetailsViewModelProtocol {
    func getProduct()
    var delegate: DetailsViewModelDelegate? { get set }
}

protocol DetailsViewModelDelegate: AnyObject {
    func viewModel(_ viewModel: DetailsViewModel, didFetchProduct product: Product)
    func viewModel(_ viewModel: DetailsViewModel, didFailWithError error: AppError)
}

class DetailsViewModel: DetailsViewModelProtocol {

    weak var delegate: (any DetailsViewModelDelegate)?
    private var networkManager: NetworkManagerProtocol
    private var productName: String

    init(delegate: (any DetailsViewModelDelegate)? = nil, networkManager: NetworkManagerProtocol, productName: String) {
        self.delegate = delegate
        self.networkManager = networkManager
        self.productName = productName
    }

    func getProduct() {
        self.networkManager.fetchDigioStoreData { result in
            switch result {
            case .success(let success):
                if let product = success.products.first(where: {$0.name == self.productName}) {
                    self.delegate?.viewModel(self, didFetchProduct: product)
                }
            case .failure(let failure):
                self.delegate?.viewModel(self, didFailWithError: failure)
            }
        }
    }
}
