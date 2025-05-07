//
//  CategoryChipView.swift
//  FoodTask
//
//  Created by Reza Sharifi on 5/7/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct CategoryChipView: View {
    let category: Category
    var isSelected: Bool
    var onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 6) {
                WebImage(url: URL(string: category.image)!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 22)
                Text(category.name)
            }
            .font(.system(size: 16, weight: .semibold))
            .padding(.horizontal, 20)
            .padding(.vertical, 8)
            .foregroundStyle(isSelected ? .white : Color(hex: 0x1BAC4B))
            .background(isSelected ? Color(hex: 0x1BAC4B) : Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 100)
                    .stroke(Color(hex: 0x1BAC4B), lineWidth: 4)
            )
            .clipShape(RoundedRectangle(cornerRadius: 100))
        }
    }
}

#Preview {
    CategoryChipView(category: Category.init(id: "1", name: "Test", image: ""), isSelected: false, onTap: {})
}
