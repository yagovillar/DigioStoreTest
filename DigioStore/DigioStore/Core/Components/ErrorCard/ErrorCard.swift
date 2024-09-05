//
//  ErrorCard.swift
//  DigioStore
//
//  Created by Yago Vanzan on 05/09/24.
//

import Foundation
import UIKit

class ErrorCard {
    static func show(in viewController: UIViewController, message: String) {
        let errorCardView = ErrorCardView(message: message)
        
        let containerView = UIView(frame: viewController.view.bounds)
        containerView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        errorCardView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(errorCardView)
        
        NSLayoutConstraint.activate([
            errorCardView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            errorCardView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            errorCardView.widthAnchor.constraint(equalToConstant: 300),
            errorCardView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        viewController.view.addSubview(containerView)
        
        // Optional: Remove the container view after a delay or based on user action
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            containerView.removeFromSuperview()
        }
    }
}
