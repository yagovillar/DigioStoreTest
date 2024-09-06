//
//  DetailsViewModelDelegateMock.swift
//  DigioStoreTests
//
//  Created by Yago Vanzan on 05/09/24.
//

import Foundation
import XCTest
@testable import DigioStore

class MockDetailsViewModelDelegate: DetailsViewModelDelegate {
    var didFetchProductCalled = false
    var fetchedProduct: Product?
    var didFailWithErrorCalled = false
    var failedError: Error?
    
    func viewModel(_ viewModel: DetailsViewModel, didFetchProduct product: Product) {
        didFetchProductCalled = true
        fetchedProduct = product
    }
    
    func viewModel(_ viewModel: DetailsViewModel, didFailWithError error: AppError) {
        didFailWithErrorCalled = true
        failedError = error
    }
}
