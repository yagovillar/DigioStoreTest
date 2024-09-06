//
//  DetailsViewController.swift
//  DigioStore
//
//  Created by Yago Vanzan on 05/09/24.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {

    private let customView = DetailsView()
    private var viewModel: DetailsViewModelProtocol
    
    init(viewModel: DetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = customView
        self.title = "Detalhes"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadingView.show()
        self.viewModel.getProduct()
    }
}

extension DetailsViewController: DetailsViewModelDelegate {
    func viewModel(_ viewModel: DetailsViewModel, didFetchProduct product: Product) {
        self.customView.configure(with: product)
        LoadingView.hide()
    }
    
    func viewModel(_ viewModel: DetailsViewModel, didFailWithError error: any Error) {
        self.showErrorToast(errorMessage: error.localizedDescription)
    }
}
