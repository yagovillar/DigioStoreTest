//
//  SpotlightItem.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//

import Foundation

struct SpotlightItem: Codable {
    let name: String
    let bannerURL: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case bannerURL = "bannerURL"
        case description
    }
}
