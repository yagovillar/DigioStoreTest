//
//  HomeVIew.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//

import Foundation
import UIKit


class HomeView: UIView {
    
    typealias Strings = HomeViewModel.Strings
    
    // Create the scroll view
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // Create the stack view
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var headerLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Strings.headerText.rawValue
        return label
    }()
    
    let spotlightCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    private var cashLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Strings.cashLabel.rawValue
        return label
    }()
    
    var cashImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private var productsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Strings.productsLabel.rawValue
        return label
    }()
    
    let productsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    // Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
}

extension HomeView: ViewCode {
    func buildHierarchy() {
        // Add subviews
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        // Set up stack view with arranged subviews
        stackView.addArrangedSubview(headerLabel)
        stackView.addArrangedSubview(spotlightCollectionView)
        stackView.addArrangedSubview(cashLabel)
        stackView.addArrangedSubview(cashImageView)
        stackView.addArrangedSubview(productsLabel)
        stackView.addArrangedSubview(productsCollectionView)
    }
    
    func setupStyles() {
        self.backgroundColor = .white
        cashImageView.layer.cornerRadius = 20
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // Constraints for scrollView
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            // Constraints for stackView within scrollView
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor), // Ensure stackView width matches scrollView width
            
            spotlightCollectionView.heightAnchor.constraint(equalToConstant: 200), // Defina uma altura adequada para a coleção
            spotlightCollectionView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 6),
            productsCollectionView.heightAnchor.constraint(equalToConstant: 150), // Defina uma altura adequada para a coleção
            
            headerLabel.heightAnchor.constraint(equalToConstant: 50),
            cashLabel.heightAnchor.constraint(equalToConstant: 50),
            cashImageView.heightAnchor.constraint(equalToConstant: 100),
            productsLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupAdditionalConfiguration() {
        // Additional configuration if needed
    }
}
