//
//  ErrorCard.swift
//  DigioStore
//
//  Created by Yago Vanzan on 05/09/24.
//

import UIKit

class ErrorCard: UIView {
    
    private var message: String
    private var duration: TimeInterval
    
    // Init customizado para configurar a mensagem e a duração
    init(message: String, duration: TimeInterval = 3.0) {
        self.message = message
        self.duration = duration
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = UIColor.red.withAlphaComponent(0.9) // Fundo vermelho
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let toastLabel = UILabel()
        toastLabel.text = message
        toastLabel.textColor = .white
        toastLabel.textAlignment = .left
        toastLabel.font = .systemFont(ofSize: 16) // Tamanho de fonte maior para melhor visibilidade
        toastLabel.numberOfLines = 0
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(toastLabel)
        
        // Constraints para toastLabel
        NSLayoutConstraint.activate([
            toastLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            toastLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            toastLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            toastLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
        ])
    }
    
    // Método estático para exibir o ErrorCard a partir de um UIViewController
    static func show(message: String, on viewController: UIViewController, duration: TimeInterval = 3.0) {
        let errorCard = ErrorCard(message: message, duration: duration)
        
        // Adiciona o ErrorCard à view do viewController
        viewController.view.addSubview(errorCard)
        
        // Configurações de layout
        NSLayoutConstraint.activate([
            errorCard.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
            errorCard.bottomAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            errorCard.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor, constant: 20),
            errorCard.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor, constant: -20),
            errorCard.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        // Animação de aparição e remoção do card
        errorCard.alpha = 0.0
        UIView.animate(withDuration: 0.5, animations: {
            errorCard.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: duration, options: [], animations: {
                errorCard.alpha = 0.0
            }, completion: { _ in
                errorCard.removeFromSuperview()
            })
        })
    }
}
