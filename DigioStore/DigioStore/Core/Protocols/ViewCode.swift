//
//  ViewCode.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//

import Foundation

protocol ViewCode {
    func buildHierarchy()
    func setupConstraints()
    func setupStyles()
    func setupAdditionalConfiguration()
    func setupView()
}

extension ViewCode {

    // Method to setup the view by calling all necessary setup steps
    func setupView() {
        buildHierarchy()
        setupConstraints()
        setupStyles()
        setupAdditionalConfiguration()
    }

    // Default implementation of setupAdditionalConfiguration (optional method)
    func setupAdditionalConfiguration() {}
}


