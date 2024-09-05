//
//  UIView+Extensions.swift
//  DigioStore
//
//  Created by Yago Vanzan on 05/09/24.
//

import Foundation
import UIKit

extension UIView {
    func showToast(message: String, duration: TimeInterval = 3.0) {
        // Container para adicionar padding
        let containerView = UIView()
        containerView.backgroundColor = UIColor.red.withAlphaComponent(0.9) // Fundo vermelho
        containerView.layer.cornerRadius = 10
        containerView.clipsToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        let toastLabel = UILabel()
        toastLabel.text = message
        toastLabel.textColor = .white
        toastLabel.textAlignment = .left
        toastLabel.font = .systemFont(ofSize: 16) // Tamanho de fonte maior para melhor visibilidade
        toastLabel.numberOfLines = 0
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(toastLabel)
        
        // Adicione o containerView à view principal
        self.addSubview(containerView)
        
        // Constraints para containerView
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            containerView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        // Constraints para toastLabel dentro do containerView
        NSLayoutConstraint.activate([
            toastLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            toastLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            toastLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            toastLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15)
        ])
        
        UIView.animate(withDuration: 0.5, animations: {
            containerView.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: duration, options: [], animations: {
                containerView.alpha = 0.0
            }, completion: { _ in
                containerView.removeFromSuperview()
            })
        })
    }
}
