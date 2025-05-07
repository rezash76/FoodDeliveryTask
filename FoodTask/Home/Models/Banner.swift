//
//  Banner.swift
//  FoodTask
//
//  Created by Reza Sharifi on 5/6/25.
//

import Foundation

struct Banner: Codable, Identifiable {
    let id = UUID()
    let imageUrl: String
    let linkUrl: String

    enum CodingKeys: String, CodingKey {
        case imageUrl
        case linkUrl
    }
}
