//
//  DigioStore.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//

import Foundation

struct DigioStore: Codable, Equatable {
    let spotlight: [SpotlightItem]
    let products: [Product]
    let cash: CashItem
    
    enum CodingKeys: String, CodingKey {
        case spotlight
        case products
        case cash
    }
}
