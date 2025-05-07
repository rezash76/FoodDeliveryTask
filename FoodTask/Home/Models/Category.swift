//
//  Category.swift
//  FoodTask
//
//  Created by Reza Sharifi on 5/6/25.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
    }
}
