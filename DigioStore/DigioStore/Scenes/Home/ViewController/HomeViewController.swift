//
//  HomeViewController.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    private let customView: HomeView = HomeView()
    private var viewModel: HomeViewModelProtocol
    
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.getProducts()
    }

    override func loadView() {
        super.loadView()
        self.view = customView
        self.title = "DigioStore"
    }

    func setupView() {
        customView.productsCollectionView.delegate = self
        customView.productsCollectionView.dataSource = self
        customView.productsCollectionView.register(DigioStoreCollectionViewCell.self,
                                             forCellWithReuseIdentifier: "DigioStoreCollectionViewCell")
        customView.spotlightCollectionView.delegate = self
        customView.spotlightCollectionView.dataSource = self
        customView.spotlightCollectionView.register(DigioStoreCollectionViewCell.self,
                                              forCellWithReuseIdentifier: "DigioStoreCollectionViewCell")
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func didGetProducts() {
        DispatchQueue.main.async {
            self.customView.productsCollectionView.reloadData()
            self.customView.spotlightCollectionView.reloadData()
            self.customView.cashImageView.loadImage(from: self.viewModel.products?.cash.bannerURL ?? "")
        }
    }
    
    func didFail(error: String) {
        ErrorCard.show(in: self, message: error)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == customView.productsCollectionView {
            let numberOfItemsPerRow: CGFloat = 2.5 // Uma célula por linha
            let spacing: CGFloat = 0 // Sem espaçamento entre células
            let totalSpacing = (numberOfItemsPerRow - 1) * spacing
            let width = 120 - totalSpacing

            return CGSize(width: width, height: width)
        } else {
            let numberOfItemsPerRow: CGFloat = 1 // Uma célula por linha
            let spacing: CGFloat = 0 // Sem espaçamento entre células
            let totalSpacing = (numberOfItemsPerRow - 1) * spacing
            let width = 350 - totalSpacing
            let height: CGFloat = 150 // Defina uma altura adequada para a célula

            return CGSize(width: width, height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // Set the minimum spacing between rows
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == customView.productsCollectionView {
            return viewModel.products?.products.count ?? 0
        } else {
            return viewModel.products?.spotlight.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == customView.productsCollectionView {
            let imgUrl = viewModel.products?.products[indexPath.row].imageURL
            return configureCell(for: collectionView, at: indexPath, imageURL: imgUrl, isProduct: true)
        } else {
            let imgUrl = viewModel.products?.spotlight[indexPath.row].bannerURL
            return configureCell(for: collectionView, at: indexPath, imageURL: imgUrl)
        }
    }
    
    private func configureCell(for collectionView: UICollectionView, at indexPath: IndexPath, imageURL: String?, isProduct: Bool = false) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DigioStoreCollectionViewCell", for: indexPath) as! DigioStoreCollectionViewCell
        if let imgUrl = imageURL {
            cell.configure(with: imgUrl, isProduct: isProduct)
        }
        return cell
    }

    
    
}
