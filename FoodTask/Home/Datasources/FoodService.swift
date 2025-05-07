//
//  FoodService.swift
//  FoodTask
//
//  Created by Reza Sharifi on 5/6/25.
//

import Foundation
import Combine

class FoodService {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchBanners() -> AnyPublisher<[Banner], Error> {
        guard let url = URL(string: ApiConstants.baseUrl + ApiConstants.banners) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        return networkService
            .fetchDecodedData(from: url)
    }
    
    func fetchCategories() -> AnyPublisher<[Category], Error> {
        guard let url = URL(string: ApiConstants.baseUrl + ApiConstants.categories) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        return networkService
            .fetchDecodedData(from: url)
    }
    
    func fetchPromoFoods() -> AnyPublisher<[Food], Error> {
        guard let url = URL(string: ApiConstants.baseUrl + ApiConstants.promoFoods) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        return networkService
            .fetchDecodedData(from: url)
    }
    
    func fetchFoods(by categoryId: String) -> AnyPublisher<[Food], Error> {
        guard let url = URL(string: ApiConstants.baseUrl + ApiConstants.foods + categoryId) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        return networkService
            .fetchDecodedData(from: url)
    }
}
