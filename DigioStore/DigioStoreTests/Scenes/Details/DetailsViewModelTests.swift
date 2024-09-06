//
//  DetailsViewModelTests.swift
//  DigioStoreTests
//
//  Created by Yago Vanzan on 05/09/24.
//

import Foundation
import XCTest
@testable import DigioStore

final class DetailsViewModelTests: XCTestCase {
    
    var viewModel: DetailsViewModel!
    var mockNetworkManager: MockNetworkManager!
    var mockDelegate: MockDetailsViewModelDelegate!
    
    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
        mockDelegate = MockDetailsViewModelDelegate()
        viewModel = DetailsViewModel(delegate: mockDelegate, networkManager: mockNetworkManager, productName: "Test Product")
    }
    
    override func tearDown() {
        viewModel = nil
        mockNetworkManager = nil
        mockDelegate = nil
        super.tearDown()
    }
    
    func testGetProductSuccess() {
        // Arrange
        let product = Product(name: "Test Product", imageURL: "http://example.com/image.jpg", description: "A great product.")
        let digioStore = DigioStore(spotlight: [], products: [product], cash: CashItem(title: "", bannerURL: "", description: "")) // Ajuste conforme necessário
        mockNetworkManager.result = .success(digioStore)
        
        // Act
        viewModel.getProduct()
        
        // Assert
        XCTAssertTrue(mockDelegate.didFetchProductCalled)
        XCTAssertEqual(mockDelegate.fetchedProduct, product)
    }
    
    func testGetProductNotFound() {
        // Arrange
        let digioStore = DigioStore(spotlight: [], products: [], cash: CashItem(title: "", bannerURL: "", description: "")) // Ajuste conforme necessário
        mockNetworkManager.result = .success(digioStore)
        
        // Act
        viewModel.getProduct()
        
        // Assert
        XCTAssertTrue(mockDelegate.didFailWithErrorCalled)
        XCTAssertEqual(mockDelegate.failedError as? AppError, AppError.noData)
    }
    
    func testGetProductFailure() {
        // Arrange
        let error = AppError.custom("Network error")
        mockNetworkManager.result = .failure(error)
        
        // Act
        viewModel.getProduct()
        
        // Assert
        XCTAssertTrue(mockDelegate.didFailWithErrorCalled)
        XCTAssertEqual(mockDelegate.failedError as? AppError, error)
    }
}


