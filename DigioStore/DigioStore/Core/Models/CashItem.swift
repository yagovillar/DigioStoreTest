//
//  CashItem.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//

import Foundation

struct CashItem: Codable {
    let title: String
    let bannerURL: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case bannerURL = "bannerURL"
        case description
    }
}
