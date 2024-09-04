//
//  Products.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//

import Foundation

struct Product: Codable {
    let name: String
    let imageURL: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "imageURL"
        case description
    }
}
