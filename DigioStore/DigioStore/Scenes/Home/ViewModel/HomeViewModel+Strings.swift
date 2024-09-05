//
//  HomeViewModel+Strings.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//

import Foundation

extension HomeViewModel {
    enum Strings: String {
        case headerText = "Olá, Maria"
        case cashLabel = "digio Cash"
        case productsLabel = "Produtos"
        
        var text: String {
            return self.rawValue
        }
    }
}
