//
//  ErrorHandler.swift
//  DigioStore
//
//  Created by Yago Vanzan on 05/09/24.
//

import Foundation
import UIKit

protocol ErrorHandlerProtocol {
    func handleError(_ error: AppError, on viewController: UIViewController)
}

class ErrorHandler: ErrorHandlerProtocol {
    static let shared = ErrorHandler()
    
    private init() {}
    
    func handleError(_ error: AppError, on viewController: UIViewController) {
        switch error {
        case .networkError:
            showToast(on: viewController, message: "Network Error. Please try again.", backgroundColor: .red)
        case .invalidData:
            showToast(on: viewController, message: "Invalid Data Received", backgroundColor: .red)
        case .custom(let message):
            showToast(on: viewController, message: message, backgroundColor: .red)
        }
    }
    
    private func showToast(on viewController: UIViewController, message: String, backgroundColor: UIColor) {
        ErrorCard.show(message: message, on: viewController.view)
    }
}
