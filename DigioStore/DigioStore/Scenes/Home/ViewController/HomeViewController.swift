//
//  HomeViewController.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    private let customView = HomeView()
    private var viewModel: HomeViewModelProtocol
    
    // MARK: - Initializers
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadingView.show()
        setupView()
        viewModel.delegate = self
        viewModel.getProducts()
    }
    
    override func loadView() {
        self.view = customView
        self.title = "DigioStore"
    }
    
    // MARK: - Setup
    private func setupView() {
        configureCollectionView(customView.productsCollectionView)
        configureCollectionView(customView.spotlightCollectionView)
    }
    
    private func configureCollectionView(_ collectionView: UICollectionView) {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DigioStoreCollectionViewCell.self, forCellWithReuseIdentifier: "DigioStoreCollectionViewCell")
    }
}

// MARK: - HomeViewModelDelegate
extension HomeViewController: HomeViewModelDelegate {
    func viewModel(_ viewModel: any HomeViewModelProtocol, didFetchProducts products: DigioStore) {
        DispatchQueue.main.async {
            self.customView.productsCollectionView.reloadData()
            self.customView.spotlightCollectionView.reloadData()
            if let bannerURL = self.viewModel.products?.cash.bannerURL {
                self.customView.cashImageView.loadImage(from: bannerURL)
            }
        }
        LoadingView.hide()
    }
    
    func viewModel(_ viewModel: any HomeViewModelProtocol, didFailWithError error: any Error) {
        showErrorToast(errorMessage: error.localizedDescription)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // Número de itens por seção
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == customView.productsCollectionView {
            return viewModel.products?.products.count ?? 0
        } else {
            return viewModel.products?.spotlight.count ?? 0
        }
    }
    
    // Configura as células
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let isProduct = (collectionView == customView.productsCollectionView)
        let imgUrl = isProduct ? viewModel.products?.products[indexPath.row].imageURL : viewModel.products?.spotlight[indexPath.row].bannerURL
        
        return configureCell(for: collectionView, at: indexPath, imageURL: imgUrl, isProduct: isProduct)
    }
    
    // Configura célula individualmente
    private func configureCell(for collectionView: UICollectionView, at indexPath: IndexPath, imageURL: String?, isProduct: Bool) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DigioStoreCollectionViewCell", for: indexPath) as! DigioStoreCollectionViewCell
        if let imgUrl = imageURL {
            cell.configure(with: imgUrl, isProduct: isProduct)
        }
        return cell
    }
    
    // Define o tamanho das células
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == customView.productsCollectionView {
            return CGSize(width: 120, height: 120)
        } else {
            return CGSize(width: 350, height: 150)
        }
    }
    
    // Define o espaçamento entre as linhas
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let product = viewModel.products?.products[indexPath.row] else { return }

        switch collectionView {
        case customView.productsCollectionView:
            viewModel.goToDetail(productName: product.name)
        default:
            break
        }
    }

}
