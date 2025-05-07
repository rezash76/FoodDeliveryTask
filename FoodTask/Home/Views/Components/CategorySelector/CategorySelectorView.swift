//
//  CategorySelectorView.swift
//  FoodTask
//
//  Created by Reza Sharifi on 5/7/25.
//

import SwiftUI

struct CategorySelectorView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    @State private var selectedCategoryID: String? = nil
    
    private let allId = "All"
    private let allImageUrl = "https://static-00.iconduck.com/assets.00/check-mark-button-emoji-2048x2048-lq7rf7h8.png"
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                CategoryChipView(
                    category: Category.init(id: allId, name: allId, image: allImageUrl),
                    isSelected: selectedCategoryID == nil
                ) {
                    selectedCategoryID = nil
                    viewModel.fetchFoods(by: allId)
                }
                
                ForEach(viewModel.categories) { category in
                    CategoryChipView(category: category, isSelected: selectedCategoryID == category.id) {
                        guard selectedCategoryID != category.id else { return }
                        selectedCategoryID = category.id
                        viewModel.fetchFoods(by: category.id)
                    }
                }
            }
        }
    }
}

#Preview {
    CategorySelectorView()
}
