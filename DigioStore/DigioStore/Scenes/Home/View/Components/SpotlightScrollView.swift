//
//  SpotlightScrollView.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//

import Foundation

import UIKit

class SpotlightScrollView: UIScrollView {
    
    private var 
    
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

extension SpotlightScrollView: ViewCode {
    func buildHierarchy() {
        <#code#>
    }
    
    func setupConstraints() {
        <#code#>
    }
    
    func setupStyles() {
        <#code#>
    }
}

