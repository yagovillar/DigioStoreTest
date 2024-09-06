//
//  HomeVIewModelTests.swift
//  DigioStoreTests
//
//  Created by Yago Vanzan on 05/09/24.
//

import Foundation
import XCTest
@testable import DigioStore

class HomeViewModelTests: XCTestCase {
    
    var viewModel: HomeViewModel!
    var mockNetworkManager: MockNetworkManager!
    var mockDelegate: MockHomeViewModelDelegate!

    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
        mockDelegate = MockHomeViewModelDelegate()
        viewModel = HomeViewModel(networkManager: mockNetworkManager)
        viewModel.delegate = mockDelegate
    }

    override func tearDown() {
        viewModel = nil
        mockNetworkManager = nil
        mockDelegate = nil
        super.tearDown()
    }
    
    func testGetProductsSuccess() {
        // Arrange
        let product = Product(name: "Test Product", imageURL: "http://example.com/image.jpg", description: "A great product.")
        let digioStore = DigioStore(spotlight: [], products: [product], cash: CashItem(title: "", bannerURL: "", description: "")) // Ajuste conforme necessário
        mockNetworkManager.result = .success(digioStore)
        
        // Act
        viewModel.getProducts()
        
        // Assert
        XCTAssertTrue(mockDelegate.didFetchProductsCalled)
        XCTAssertEqual(mockDelegate.fetchedProducts, digioStore)
    }
    
    func testGetProductsFailure() {
        // Arrange
        let error = AppError.custom("Network error")
        mockNetworkManager.result = .failure(error)
        
        // Act
        viewModel.getProducts()
        
        // Assert
        XCTAssertTrue(mockDelegate.didFailWithErrorCalled)
        XCTAssertEqual(mockDelegate.error, error)
    }
    
    func testGoToDetail() {
        // Arrange
        let productName = "Test Product"
        let mockCoordinator = MockCoordinator()
        viewModel.coordinatorDelegate = mockCoordinator
        
        // Act
        viewModel.goToDetail(productName: productName)
        
        // Assert
        XCTAssertTrue(mockCoordinator.didGoToDetailsCalled)
        XCTAssertEqual(mockCoordinator.productName, productName)
    }
    
    // Mock para o HomeCoordinatorFlow
    class MockCoordinator: HomeCoordinatorFlow {
        var didGoToDetailsCalled = false
        var productName: String?
        
        func goToDetails(productName: String) {
            didGoToDetailsCalled = true
            self.productName = productName
        }
    }
}
