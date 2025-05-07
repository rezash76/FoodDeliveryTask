//
//  NetworkService.swift
//  FoodTask
//
//  Created by Reza Sharifi on 5/6/25.
//

import Foundation
import Combine

protocol NetworkService {
    func fetchDecodedData<T: Decodable>(from url: URL) -> AnyPublisher<T, Error>
}

class NetworkServiceProvider: NetworkService {
    
    func fetchDecodedData<T: Decodable>(from url: URL) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
