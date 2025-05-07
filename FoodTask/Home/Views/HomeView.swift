//
//  HomeView.swift
//  FoodTask
//
//  Created by Reza Sharifi on 5/6/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    @State private var scrollOffset: CGFloat = 0
    @State private var searchBarHeight: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                navbarHeaderView
                    .padding(.horizontal, 24)
                    .padding(.bottom, 22)
                    .zIndex(2)
                
                scrollableBody
            }
        }
        .shimmer(when: viewModel.isLoading)
    }
}

extension HomeView {
    
    private var navbarHeaderView: some View {
        HStack(spacing: 16) {
            HeaderView()
            NavbarButton(iconImage: .notification) {
                print("ads")
            }
            NavbarButton(iconImage: .bag) {
                print("ads")
            }
        }
    }
    
    private var scrollableBody: some View {
        GeometryReader { mainGeometry in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    GeometryReader { geometry in
                        Color.clear.preference(key: ScrollOffsetPreferenceKey.self,
                                               value: geometry.frame(in: .named("scrollView")).minY)
                    }
                    .frame(height: 0)
                    
                    VStack(spacing: 22) {
                        searchBarSection
                        
                        SectionTitleButtonView(title: "Special Offers") {
                            print("Go To Special Offers Page")
                        }
                        
                        if !viewModel.banners.isEmpty {
                            BannerSliderView(imageUrls: viewModel.banners.map { $0.imageUrl }) { linkUrlString in
                                viewModel.openBannerLink(url: linkUrlString)
                            }
                        }
                        
                        if !viewModel.categories.isEmpty {
                            categoriesView
                        }
                        
                        SectionTitleButtonView(title: "Discount Guaranteed! 👌") {
                            print("Go To Discount Page")
                        }
                        
                        if !viewModel.promoFoods.isEmpty {
                            promoFoodSection
                        }
                        
                        SectionTitleButtonView(title: "Recommended For You 😍") {
                            print("Go To Recommended Page")
                        }
                        
                        CategorySelectorView()
                            .padding(.trailing, -24)
                        
                        foodsListSection
                    }
                    .padding(.horizontal, 24)
                }
            }
            .coordinateSpace(name: "scrollView")
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                scrollOffset = value
            }
        }
    }
    
    private var searchBarSection: some View {
        SearchBarView(searchText: .constant(""))
            .background {
                GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            searchBarHeight = geometry.size.height
                        }
                }
            }
            .offset(y: min(0, scrollOffset))
            .zIndex(1)
    }
    
    private var categoriesView: some View {
        let columns = [
            GridItem(.flexible(), spacing: 10),
            GridItem(.flexible(), spacing: 10),
            GridItem(.flexible(), spacing: 10),
            GridItem(.flexible(), spacing: 10)
        ]
        
        return LazyVGrid(columns: columns, spacing: 12) {
            ForEach(viewModel.categories) { category in
                VStack(spacing: 8) {
                    WebImage(url: URL(string: category.image)!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 58)
                    
                    Text(category.name)
                        .font(.system(size: 12, weight: .bold))
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                }
                .frame(height: 90)
                .padding(8)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
    }
    
    private var promoFoodSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.promoFoods) { food in
                    PromoFoodCard(food: food)
                        .padding(.trailing, 8)
                }
            }
        }
        .padding(.trailing, -24)
        .scrollClipDisabled()
    }
    
    private var foodsListSection: some View {
        ForEach(viewModel.foods) { food in
            FoodCard(food: food)
        }
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#Preview {
    HomeView()
}
