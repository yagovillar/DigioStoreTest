//
//  UIViewController+Extensions.swift
//  DigioStore
//
//  Created by Yago Vanzan on 05/09/24.
//

import Foundation
import UIKit

extension UIViewController {
    func showErrorToast(errorMessage: String) {
        self.view.showToast(message: errorMessage)
    }
}
