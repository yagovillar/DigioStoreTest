//
//  ViewController.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//

import UIKit

class MainViewController: UIViewController {
    private let customView = MainView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view = customView
    }
}

