//
//  PromoFoodItem.swift
//  FoodTask
//
//  Created by Reza Sharifi on 5/6/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct PromoFoodCard: View {
    let food: Food
    @State private var isFavorite: Bool = true
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .topLeading) {
                FoodImageView(urlString: food.imageUrl, size: 192)
                if food.promo {
                    promoLabel
                }
            }
            
            FoodInfoView(food: food, isFavorite: $isFavorite)
            
        }
        .padding(14)
        .frame(width: 220)
        .background {
            RoundedRectangle(cornerRadius: 28)
                .fill(Color.white)
                .shadow(color: Color(hex: 0x04060F0D).opacity(0.05), radius: 30, x: 0, y: 4)
        }
    }
}

extension PromoFoodCard {
    private var promoLabel: some View {
        Text("PROMO")
            .font(.system(size: 10, weight: .semibold))
            .foregroundColor(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color(hex: 0x1BAC4B))
            )
            .padding(12)
    }
}

#Preview {
    PromoFoodCard(food: Food.init(id: 1, name: "Mixed Salad Bomb", category: "Test", imageUrl: "", price: 6, rating: 4.89, ratingCount: 1.2, promo: true, distance: 1.5))
}
