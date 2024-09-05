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
    
    // MARK: - Subviews
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let headerLabel = HomeView.createLabel(withText: Strings.headerText.rawValue)
    private let cashLabel = HomeView.createLabel(withText: Strings.cashLabel.rawValue)
    private let productsLabel = HomeView.createLabel(withText: Strings.productsLabel.rawValue)
    
    let spotlightCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    var cashImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.clipsToBounds = true
        return imgView
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
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Helper Method
    
    private static func createLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        return label
    }
}

extension HomeView: ViewCode {
    
    // MARK: - ViewCode Methods
    
    func buildHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
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
            // scrollView constraints
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            // stackView constraints
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor), // Ensure stackView width matches scrollView width
            
            // spotlightCollectionView height
            spotlightCollectionView.heightAnchor.constraint(equalToConstant: 200),
            
            // productsCollectionView height
            productsCollectionView.heightAnchor.constraint(equalToConstant: 150),
            
            // Fixed heights for labels and cashImageView
            headerLabel.heightAnchor.constraint(equalToConstant: 50),
            cashLabel.heightAnchor.constraint(equalToConstant: 50),
            cashImageView.heightAnchor.constraint(equalToConstant: 100),
            productsLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupAdditionalConfiguration() {
        // Any additional configurations can go here
    }
}
