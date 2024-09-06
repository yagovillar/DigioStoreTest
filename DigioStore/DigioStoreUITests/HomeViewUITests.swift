//
//  HomeViewUiTests.swift
//  DigioStoreUITests
//
//  Created by Yago Vanzan on 06/09/24.
//

import Foundation
import XCTest

class HomeViewUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false

        // Launch the app
        app = XCUIApplication()
        app.launch()
    }

    func testHomeViewComponents() throws {
        // Check if headerLabel exists
        let headerLabel = app.staticTexts["Header"] // Assuming accessibilityIdentifier is set to "Header"
        XCTAssertTrue(headerLabel.exists, "Header label does not exist")

        // Check if spotlightCollectionView exists
        let spotlightCollectionView = app.collectionViews["SpotlightCollectionView"] // Assuming accessibilityIdentifier is set to "SpotlightCollectionView"
        XCTAssertTrue(spotlightCollectionView.exists, "Spotlight collection view does not exist")
        
        // Check if cashLabel exists
        let cashLabel = app.staticTexts["CashLabel"] // Assuming accessibilityIdentifier is set to "CashLabel"
        XCTAssertTrue(cashLabel.exists, "Cash label does not exist")
        
        // Check if cashImageView exists
        let cashImageView = app.images["CashImageView"] // Assuming accessibilityIdentifier is set to "CashImageView"
        XCTAssertTrue(cashImageView.exists, "Cash image view does not exist")

        // Check if productsCollectionView exists
        let productsCollectionView = app.collectionViews["ProductsCollectionView"] // Assuming accessibilityIdentifier is set to "ProductsCollectionView"
        XCTAssertTrue(productsCollectionView.exists, "Products collection view does not exist")
    }
}
