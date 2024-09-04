//
//  ViewController.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//

import UIKit

class MainViewController: UIViewController {
    private let customView = MainView()
    private var viewModel:MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.viewModel.goToHomeScreen()
        }
    }
    
    override func loadView() {
        super.loadView()
        view = customView
    }
}

