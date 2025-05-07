//
//  FoodCard.swift
//  FoodTask
//
//  Created by Reza Sharifi on 5/7/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct FoodCard: View {
    let food: Food
    @State private var isFavorite: Bool = true
    
    var body: some View {
        HStack(spacing: 16) {
            FoodImageView(urlString: food.imageUrl, size: 120)
            FoodInfoView(food: food, isFavorite: $isFavorite)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 28)
                .fill(Color.white)
        }
        .shadow(color: Color(hex: 0x04060F0D).opacity(0.05), radius: 30, x: 0, y: 4)
    }
}

#Preview {
    FoodCard(food: Food.init(id: 1, name: "Mixed Salad Bomb", category: "Test", imageUrl: "", price: 6, rating: 4.89, ratingCount: 1.2, promo: true, distance: 1.5))
}
