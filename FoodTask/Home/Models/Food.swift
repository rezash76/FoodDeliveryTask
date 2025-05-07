//
//  FoodItem.swift
//  FoodTask
//
//  Created by Reza Sharifi on 5/6/25.
//

import Foundation

struct Food: Codable, Identifiable {
    let id: Int
    let name: String
    let category: String
    let imageUrl: String
    let price: Double
    let rating: Double
    let ratingCount: Double
    let promo: Bool
    let distance: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case category
        case imageUrl
        case price
        case rating
        case ratingCount
        case promo
        case distance
    }
    
    var formattedDistance: String {
        String(format: "%.1f km", distance)
    }
    
    var formattedRating: String {
        String(format: "%.1f", rating)
    }
    
    var formattedRatingCount: String {
        return "(" + String(format: "%.1f", ratingCount) + "k)"
    }
    
    var formattedPrice: String {
        String(format: "$%.2f", price)
    }
}
