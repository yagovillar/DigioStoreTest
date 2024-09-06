//
//  HomeVIewModelDelegateMock.swift
//  DigioStoreTests
//
//  Created by Yago Vanzan on 05/09/24.
//

import Foundation
import XCTest
@testable import DigioStore

class MockHomeViewModelDelegate: HomeViewModelDelegate {
    var didFetchProductsCalled = false
    var didFailWithErrorCalled = false
    var fetchedProducts: DigioStore?
    var error: AppError?
    
    func viewModel(_ viewModel: HomeViewModelProtocol, didFetchProducts products: DigioStore) {
        didFetchProductsCalled = true
        fetchedProducts = products
    }
    
    func viewModel(_ viewModel: HomeViewModelProtocol, didFailWithError error: AppError) {
        didFailWithErrorCalled = true
        self.error = error
    }
}
