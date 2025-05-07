//
//  FoodInfoView.swift
//  FoodTask
//
//  Created by Reza Sharifi on 5/7/25.
//

import SwiftUI

struct FoodInfoView: View {
    let food: Food
    @Binding var isFavorite: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(food.name)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color(hex: 0x212121))
                .lineLimit(1)
                .padding(.top, 10)
            
            distanceAndRateRow
                .foregroundStyle(Color(hex: 0x616161))
                .font(.system(size: 12, weight: .medium))
            
            priceInfoRow
        }
    }
}

extension FoodInfoView {
    
    private var distanceAndRateRow: some View {
        HStack(spacing: 5) {
            Text(food.formattedDistance)
            Text("|")
            HStack(spacing: 6) {
                Image(.star)
                Text(food.formattedRating)
                Text(food.formattedRatingCount)
            }
        }
    }
    
    private var priceInfoRow: some View {
        HStack {
            Text(food.formattedPrice)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color(hex: 0x1BAC4B))
            if food.price > 0 {
                Text("|")
                    .font(.system(size: 10))
                    .foregroundStyle(Color(hex: 0x616161))
                Image(.delivery)
                Text(food.formattedPrice)
                    .font(.system(size: 12))
                    .foregroundStyle(Color(hex: 0x616161))
            }
            Spacer()
            Button {
                isFavorite.toggle()
            } label: {
                Image(isFavorite ? .heartFill : .heart)
                    .frame(width: 20, height: 20)
                    .animation(nil)
            }
        }
    }
}

#Preview {
    FoodInfoView(food: Food.init(id: 1, name: "Mixed Salad Bomb", category: "Test", imageUrl: "", price: 6, rating: 4.89, ratingCount: 1.2, promo: true, distance: 1.5), isFavorite: .constant(true))
}
