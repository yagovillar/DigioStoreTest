//
//  DetailsViewUITests.swift
//  DigioStoreUITests
//
//  Created by Yago Vanzan on 06/09/24.
//

import Foundation
import XCTest

class DetailsViewUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false

        // Lança o aplicativo
        app = XCUIApplication()
        app.launch()
    }

    func testDetailsViewComponents() throws {
        // Certifique-se de que o app está na tela de detalhes
        // Isso dependerá de como a navegação está implementada
        // Caso seja necessário, adicione navegação até a `DetailsView`

        // Verificar se a imagem do produto existe
        let productImageView = app.images["ProductImageView"]
        XCTAssertTrue(productImageView.exists, "A imagem do produto não existe")

        // Verificar se o título do produto existe
        let productTitleLabel = app.staticTexts["ProductTitleLabel"]
        XCTAssertTrue(productTitleLabel.exists, "O título do produto não existe")

        // Verificar se a descrição do produto existe
        let productDescriptionLabel = app.staticTexts["ProductDescriptionLabel"]
        XCTAssertTrue(productDescriptionLabel.exists, "A descrição do produto não existe")
    }
}
