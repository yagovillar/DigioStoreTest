//
//  DetailsView.swift
//  DigioStore
//
//  Created by Yago Vanzan on 05/09/24.
//
import Foundation
import UIKit

class DetailsView: UIView {
    
    private let productImg: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit // Ajusta a imagem mantendo a proporção
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private let productTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let productDescription: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0 // Permitir múltiplas linhas
        return label
    }()
    
    // Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with product: Product) {
        DispatchQueue.main.async {
            self.productImg.loadImage(from: product.imageURL)
            self.productTitle.text = product.name
            self.productDescription.text = product.description
        }
    }
}

extension DetailsView: ViewCode {
    func buildHierarchy() {
        addSubview(productImg)
        addSubview(productTitle)
        addSubview(productDescription)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // Constraints para a imagem do produto
            productImg.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            productImg.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            productImg.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            productImg.heightAnchor.constraint(equalToConstant: 200), // Ajuste a altura conforme necessário
            
            // Constraints para o título do produto
            productTitle.topAnchor.constraint(equalTo: productImg.bottomAnchor, constant: 8),
            productTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            productTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            productTitle.heightAnchor.constraint(equalToConstant: 47),
            
            // Constraints para a descrição do produto
            productDescription.topAnchor.constraint(equalTo: productTitle.bottomAnchor, constant: 8),
            productDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            productDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        ])
    }
    
    func setupStyles() {
        backgroundColor = .white
    }
}
