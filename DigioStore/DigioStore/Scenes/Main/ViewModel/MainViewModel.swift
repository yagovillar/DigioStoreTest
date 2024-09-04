//
//  MainViewModel.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//

import Foundation

protocol MainViewModelProtocol {
    func goToHomeScreen()
}

class MainViewModel: MainViewModelProtocol {
    var delegate: MainCoordinatorFlowDelegate
    
    init(delegate: MainCoordinatorFlowDelegate) {
        self.delegate = delegate
    }
    
    func goToHomeScreen() {
        delegate.goToHomeScreen()
    }
}
