//
//  FoodRepository.swift
//  FoodTask
//
//  Created by Reza Sharifi on 5/6/25.
//

import Combine

protocol FoodRepository {
    func getBanners() -> AnyPublisher<[Banner], Error>
    func getAllCategories() -> AnyPublisher<[Category], Error>
    func getPromoFoods() -> AnyPublisher<[Food], Error>
    func getAllFoods(by categoryId: String) -> AnyPublisher<[Food], Error>
}

final class FoodRepositoryProvider : FoodRepository {
    
    private var foodService: FoodService
    
    init(foodService: FoodService) {
        self.foodService = foodService
    }
    
    
    func getBanners() -> AnyPublisher<[Banner], Error> {
        foodService.fetchBanners()
            .catch { error -> AnyPublisher<[Banner], Error> in
                return Fail(error: error)
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
    
    func getAllCategories() -> AnyPublisher<[Category], Error> {
        foodService.fetchCategories()
            .catch { error -> AnyPublisher<[Category], Error> in
                return Fail(error: error)
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
    
    func getPromoFoods() -> AnyPublisher<[Food], Error> {
        foodService.fetchPromoFoods()
            .catch { error -> AnyPublisher<[Food], Error> in
                return Fail(error: error)
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
    
    func getAllFoods(by categoryId: String) -> AnyPublisher<[Food], Error> {
        foodService.fetchFoods(by: categoryId)
            .catch { error -> AnyPublisher<[Food], Error> in
                return Fail(error: error)
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
