//
//  HomeViewModel.swift
//  FoodTask
//
//  Created by Reza Sharifi on 5/6/25.
//

import Foundation
import Combine
import SwiftUI

class HomeViewModel: ObservableObject {
    
    enum DataState<T> {
        case idle
        case loading
        case loaded(T)
        case error(Error)
    }
    
    // data state properties
    @Published var foodsState: DataState<[Food]> = .idle
    @Published var promoFoodsState: DataState<[Food]> = .idle
    @Published var bannersState: DataState<[Banner]> = .idle
    @Published var categoriesState: DataState<[Category]> = .idle
    
    @Published var isLoading = false
    
    // properties
    @Published var foods: [Food] = []
    @Published var promoFoods: [Food] = []
    @Published var banners: [Banner] = []
    @Published var categories: [Category] = []
    
    private let foodRepository: FoodRepository
    
    private var cancellables = Set<AnyCancellable>()
    
    init(foodRepository: FoodRepository) {
        self.foodRepository = foodRepository
        isLoading = true
        getAllData()
    }
    
    private func getAllData() {
        fetchBanners()
        fetchCategories()
        fetchPromoFoods()
        fetchFoods(by: "all")
        isLoading = false
    }
    
    func openBannerLink(url: String) {
        guard let url = URL(string: url) else { return }
        UIApplication.shared.open(url)
    }
    
    func fetchBanners() {
        foodRepository.getBanners()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { /*[weak self]*/ completion in
            }, receiveValue: { [weak self] response in
                guard let `self` else { return }
                
                self.banners = response
            })
            .store(in: &cancellables)
    }
    
    func fetchCategories() {
        foodRepository.getAllCategories()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
            }, receiveValue: { [weak self] response in
                guard let `self` else { return }
                
                self.categories = response
            })
            .store(in: &cancellables)
    }
    
    func fetchPromoFoods() {
        foodRepository.getPromoFoods()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
            }, receiveValue: { [weak self] response in
                guard let `self` else { return }
                
                self.promoFoods = response
                
            })
            .store(in: &cancellables)
    }
    
    func fetchFoods(by categoryId: String) {
        foodRepository.getAllFoods(by: categoryId)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
            }, receiveValue: { [weak self] response in
                guard let `self` else { return }
                self.foods = response
            })
            .store(in: &cancellables)
    }
}
