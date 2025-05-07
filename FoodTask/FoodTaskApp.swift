//
//  FoodTaskApp.swift
//  FoodTask
//
//  Created by Reza Sharifi on 5/6/25.
//

import SwiftUI

@main
struct FoodTaskApp: App {
    
    let homeViewModel: HomeViewModel
    
    init() {
        let networkService = NetworkServiceProvider()
        let foodService = FoodService(networkService: networkService)
        let foodRepository = FoodRepositoryProvider(foodService: foodService)
        self.homeViewModel = HomeViewModel(foodRepository: foodRepository)
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(homeViewModel)
        }
    }
}
